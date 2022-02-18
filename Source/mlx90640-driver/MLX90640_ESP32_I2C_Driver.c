/**
 * @copyright (C) 2017 Melexis N.V.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 */
#include "MLX90640_I2C_Driver.h"
#if MLX90640_USE_ESP32_I2C
#include <driver/gpio.h>
#include <driver/i2c.h>
#include <esp_err.h>
#include <esp_log.h>


static i2c_cmd_handle_t i2c_command;
static uint8_t  currentCmdBuffer[I2C_LINK_RECOMMENDED_SIZE(7)];
static uint8_t buf[1664];

void MLX90640_I2CInit()
{   
    
    
	i2c_config_t	i2c_configuration;

	/*------------------------------------------------------------------------
	  I2C interface configuration
	  ------------------------------------------------------------------------*/

	i2c_configuration = (i2c_config_t) {
		.mode				= I2C_MODE_MASTER,
		.sda_io_num			= MLX90640_ESP_I2C_SDA_GPIO_PIN,
		.sda_pullup_en		= GPIO_PULLUP_DISABLE,
		.scl_io_num			= MLX90640_ESP_I2C_SCL_GPIO_PIN,
		.scl_pullup_en		= GPIO_PULLUP_DISABLE,
		.master.clk_speed	= 1000000,
	};

	esp_err_t esp_status = i2c_param_config(MLX90640_ESP_I2C_INTERFACE, &i2c_configuration);
	if (esp_status != ESP_OK) {
		ESP_LOGE(__func__,"%s(): I2C interface configuration failed\r\n",__func__);
		return;
	}

	/*
	 * For now, take these actions:
	 *     * Force strongest pad driver strength on SCL and SDA pins.
	 *     * Force SCL pin to output only with open drain mode.
	 *     * Force SDA pin to input and output with open drain mode.
	 *
	 * Note:
	 *     This may be adjusted/changed/deleted as bath controller board
	 *     evolves and more is learned about it.
	 */

	gpio_set_drive_capability(MLX90640_ESP_I2C_SCL_GPIO_PIN, GPIO_DRIVE_CAP_3);
	gpio_set_drive_capability(MLX90640_ESP_I2C_SDA_GPIO_PIN, GPIO_DRIVE_CAP_3);

	gpio_set_direction(MLX90640_ESP_I2C_SCL_GPIO_PIN, GPIO_MODE_OUTPUT_OD);
	gpio_set_direction(MLX90640_ESP_I2C_SDA_GPIO_PIN, GPIO_MODE_INPUT_OUTPUT_OD);

	/*------------------------------------------------------------------------
	  Install I2C driver
	  ------------------------------------------------------------------------*/

	esp_status =	i2c_driver_install(MLX90640_ESP_I2C_INTERFACE,I2C_MODE_MASTER,0,0,0);
	if (esp_status != ESP_OK) {
		ESP_LOGE(__func__,"%s(): I2C driver install failed\r\n",__func__);
	}

	/*------------------------------------------------------------------------
	  Kludge to intimidate I2C interface and/or  AD5242 chip into actually
	  fucking working after power-on/reset.  If we ever figure out cause,
	  this code can be deleted.

	  Note:
	      For some as yet unknown reason, after power-on/reset the first
	      I2C transaction times out but subsequent ones seem fine.  There
	      is no evidence of transaction on oscilloscope.  Timeout occurs
	      in i2c_master_cmd_begin() when xQueueReceive() finds no events
	      in command event queue.  Interrupt handler queues these events
	      but, given apparent absence of transaction bus activity, it
	      appears that command link never gets dispatched and interrupt
	      never fires.

	  Note:
	      Idea is to use following activity as Ex-Lax hoping to goad
	      whatever is being obstinate to start behaving:
	          * START condition
	          * Send slave address of 0x00 (which chip will not respond to)
	            as a write transaction; a read transaction also works but I
	            chose to use write transaction
	          * STOP condition
	      We expect this activity to fail with a time out when command link
	      gets dispatched.

	  Note:
	      Whenever an error occurs here, I log an error message but return
	      success code because:
	          * Some evidence should exist that error occurred
	          * We expect a timeout error to occur
	  ------------------------------------------------------------------------*/

	i2c_cmd_handle_t	i2c_command;

	ESP_LOGE(__func__,"%s(): Kludge to get bus/chip working; ignore errors until told otherwise\n",__func__);

	i2c_command = i2c_cmd_link_create();
	if (i2c_command == NULL) {
		ESP_LOGE(__func__,"%s(): i2c_cmd_link_create() memory allocation failed\r\n",__func__);
		goto free_i2c_command_link;
	}

	esp_status = i2c_master_start(i2c_command);
	if (esp_status != ESP_OK) {
		ESP_LOGE(__func__,"%s(): i2c_master_start() failed\r\n",__func__);
		goto free_i2c_command_link;
	}

	/*
	 * Read transaction also works here
	 */

	esp_status =	i2c_master_write_byte(i2c_command,(0x00|I2C_MASTER_WRITE),true);
	if (esp_status != ESP_OK) {
		ESP_LOGE(__func__,"%s(): i2c_master_write_byte() failed\r\n",__func__);
		goto free_i2c_command_link;
	}

	esp_status = i2c_master_stop(i2c_command);
	if (esp_status != ESP_OK) {
		ESP_LOGE(__func__,"%s(): i2c_master_stop() failed\r\n",__func__);
		goto free_i2c_command_link;
	}

	esp_status =	i2c_master_cmd_begin(MLX90640_ESP_I2C_INTERFACE,i2c_command,50 / portTICK_PERIOD_MS);
	if (esp_status != ESP_OK) {
		switch (esp_status) {
			case ESP_ERR_INVALID_STATE:
				ESP_LOGE(__func__,"%s(): i2c_master_cmd_begin() invalid I2C state\r\n",__func__);
				break;

			case ESP_ERR_TIMEOUT:
				ESP_LOGE(__func__,"%s(): i2c_master_cmd_begin() timeout\r\n",__func__);
				break;

			default:
				ESP_LOGE(__func__,"%s(): i2c_master_cmd_begin() failed\r\n",__func__);
				break;
		}
		goto free_i2c_command_link;
	}

free_i2c_command_link:

	ESP_LOGE(__func__,"%s(): End of kludge to get bus/chip working; errors should no longer be ignored\n",__func__);

	i2c_cmd_link_delete(i2c_command);

}

int MLX90640_I2CGeneralReset(void)
{    
	return MLX90640_I2CWrite(0x33,0x06,0x00);
}

int MLX90640_I2CRead(uint8_t slaveAddr, uint16_t startAddress, uint16_t nMemAddressRead, uint16_t *data)
{
	i2c_command = i2c_cmd_link_create_static(currentCmdBuffer, I2C_LINK_RECOMMENDED_SIZE(7));

    int result;
    // 1 byte for escape, 1 byte for addr cmd, 2 bytes for addr, 1 byte for escape, 1 byte for read, 
    // because this library is shit, it's length is in short, not bytes
    nMemAddressRead*=2;
    uint16_t *p = data;
    
    if (nMemAddressRead  > sizeof(buf))
    {
        printf("Read amount > buffer\r\n");
        return 0;
    }
    

	/*
	 * Note:
	 *     From here to function end, we CANNOT directly return to caller when
	 *     an error occurs without freeing I2C command link allocated above
	 */
	esp_err_t esp_status = ESP_OK;
	esp_status |= i2c_master_start(i2c_command);
	esp_status |= i2c_master_write_byte(i2c_command,((slaveAddr << 1)|I2C_MASTER_WRITE),1);
	esp_status |= i2c_master_write(i2c_command,startAddress,2,true);
	esp_status |= i2c_master_start(i2c_command);
	esp_status |= i2c_master_write_byte(i2c_command,((slaveAddr << 1)|I2C_MASTER_READ),1);
	esp_status |= i2c_master_read(i2c_command, buf,nMemAddressRead, I2C_MASTER_LAST_NACK);
	esp_status |= i2c_master_stop(i2c_command);


	if (esp_status != ESP_OK) {
		ESP_LOGE(__func__,"i2c cmd build failed\r\n");
		return esp_status;
	}

	esp_status =	i2c_master_cmd_begin(MLX90640_ESP_I2C_INTERFACE,i2c_command,1000/portTICK_PERIOD_MS);

		switch (esp_status) {
		case ESP_OK:
			break;
			case ESP_ERR_INVALID_STATE:
				ESP_LOGE(__func__,"i2c_master_cmd_begin() invalid I2C state\r\n");
				break;

			case ESP_ERR_TIMEOUT:
				ESP_LOGE(__func__,"i2c_master_cmd_begin() timeout\r\n");
				break;

			default:
				ESP_LOGE(__func__,"i2c_master_cmd_begin() failed\r\n");
				break;
		}




    for (int count = 0; count < nMemAddressRead/2; count++) {
        int i = count << 1;
        *p++ = ((uint16_t)buf[i] << 8) | buf[i + 1];
    }

    return esp_status;
}

void MLX90640_I2CFreqSet(int freq)
{
}

int MLX90640_I2CWrite(uint8_t slaveAddr, uint16_t writeAddress, uint16_t data)
{ 
	i2c_command = i2c_cmd_link_create_static(currentCmdBuffer, I2C_LINK_RECOMMENDED_SIZE(6));
    
   
	esp_err_t esp_status = ESP_OK;
	esp_status |= i2c_master_start(i2c_command);
	esp_status |= i2c_master_write_byte(i2c_command,((slaveAddr << 1)|I2C_MASTER_WRITE),1);
	esp_status |= i2c_master_write(i2c_command,writeAddress,2,true);
	esp_status |= i2c_master_write(i2c_command,data,2,true);
	esp_status |= i2c_master_stop(i2c_command);


	if (esp_status != ESP_OK) {
		ESP_LOGE(__func__,"i2c cmd build failed\r\n");
		return esp_status;
	}

	esp_status =	i2c_master_cmd_begin(MLX90640_ESP_I2C_INTERFACE,i2c_command,1000/portTICK_PERIOD_MS);

		switch (esp_status) {
		case ESP_OK:
			break;
			case ESP_ERR_INVALID_STATE:
				ESP_LOGE(__func__,"%s(): i2c_master_cmd_begin() invalid I2C state\r\n",__func__);
				break;

			case ESP_ERR_TIMEOUT:
				ESP_LOGE(__func__,"%s(): i2c_master_cmd_begin() timeout\r\n",__func__);
				break;

			default:
				ESP_LOGE(__func__,"%s(): i2c_master_cmd_begin() failed\r\n",__func__);
				break;
		}
    return esp_status;
}

#endif