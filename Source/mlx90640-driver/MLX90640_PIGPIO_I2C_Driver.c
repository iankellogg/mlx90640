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
#if MLX90640_USE_PIGPIO_I2C

#include <unistd.h>
#include <stdio.h>
#include <fcntl.h>
#include <string.h>
#include <pigpiod_if2.h>
#include <assert.h>




typedef enum 
{
    I2CCMD_END     = 0x00,
    I2CCMD_ESCAPE  = 0x01,
    I2CCMD_ON      = 0x02,
    I2CCMD_OFF     = 0x03,
    I2CCMD_ADDR    = 0x04,
    I2CCMD_FLAGS   = 0x05,
    I2CCMD_READ    = 0x06,
    I2CCMD_WRITE   = 0x07

} PIGPIO_I2C_ZIP_t;

// at the moment this only supports 1 slave address
static const int i2c_device = 1;
static int32_t hPIGPIO = -1;
static int32_t hi2c = -1;

void MLX90640_I2CInit()
{
    // open connection to the pigpio daemon
     hPIGPIO = pigpio_start(NULL, NULL);
     if (hPIGPIO<0)
     {
         printf("Unable to connect to PIGPIOD\r\n");
         return;
     }
}
void MLX90640_Delay(uint32_t uSec)
{
    usleep(uSec);
}

int MLX90640_I2CRead(uint8_t slaveAddr, uint16_t startAddress, uint16_t nMemAddressRead, uint16_t *data)
{
    if (hPIGPIO<0)
    {
        MLX90640_I2CInit();
    }
    if (hi2c<0) {
        hi2c = i2c_open(hPIGPIO,i2c_device,slaveAddr,0);
        assert(hi2c>=0);
    }

    int result;
    // 1 byte for escape, 1 byte for addr cmd, 2 bytes for addr, 1 byte for escape, 1 byte for read, 
    // because this library is shit, it's length is in short, not bytes
    nMemAddressRead*=2;
    char cmd[] = { I2CCMD_WRITE, 0x02, (char)(startAddress >> 8), (char)(startAddress & 0xFF), I2CCMD_ESCAPE, I2CCMD_READ,  (char)(nMemAddressRead & 0xFF) ,(char)(nMemAddressRead >> 8),I2CCMD_END};
    char buf[1664];
    uint16_t *p = data;
    
    if (nMemAddressRead  > sizeof(buf))
    {
        printf("Read amount > buffer\r\n");
        return 0;
    }
    
    int err = i2c_zip(hPIGPIO,hi2c,cmd,sizeof(cmd),buf,nMemAddressRead );
    switch (err)
    {
        case PI_BAD_HANDLE:
        printf("READ Bad Handle\r\n");
        break;
        case PI_BAD_POINTER:
        printf("READ Bad Pointer\r\n");
        break;
        case PI_BAD_I2C_CMD:
        printf("READ Bad I2C Cmd\r\n");
        break;
        case PI_BAD_I2C_RLEN:
        printf("READ Bad I2c RLEN\r\n");
        break;
        case PI_BAD_I2C_WLEN:
        printf("READ Bad I2C WLEN\r\n");
        break;
        case PI_BAD_I2C_SEG:
        printf("READ Bad I2C Seg\r\n");
        break;
        default:
        break;
    }


    for (int count = 0; count < nMemAddressRead/2; count++) {
        int i = count << 1;
        *p++ = ((uint16_t)buf[i] << 8) | buf[i + 1];
    }

    return 0;
}

void MLX90640_I2CFreqSet(int freq)
{
}

int MLX90640_I2CWrite(uint8_t slaveAddr, uint16_t writeAddress, uint16_t data)
{ 
    
    if (hPIGPIO<0)
    {
        MLX90640_I2CInit();
    }
    if (hi2c<0) {
        hi2c = i2c_open(hPIGPIO,i2c_device,slaveAddr,0);
        assert(hi2c>=0);
    }
    char cmd[] = { I2CCMD_WRITE,0x04, (char)(writeAddress >> 8), (char)(writeAddress & 0xFF), (char)(data >> 8), (char)(data & 0x00FF), I2CCMD_END };
   

   //char buf[sizeof(cmd)];
   int err = i2c_zip(hPIGPIO,hi2c,cmd,sizeof(cmd),0,0);

    switch (err)
    {
        case PI_BAD_HANDLE:
        printf("Write Bad Handle\r\n");
        break;
        case PI_BAD_POINTER:
        printf("Write Bad Pointer\r\n");
        break;
        case PI_BAD_I2C_CMD:
        printf("Write Bad I2C Cmd\r\n");
        break;
        case PI_BAD_I2C_RLEN:
        printf("Write Bad I2c RLEN\r\n");
        break;
        case PI_BAD_I2C_WLEN:
        printf("Write Bad I2C WLEN\r\n");
        break;
        case PI_BAD_I2C_SEG:
        printf("Write Bad I2C Seg\r\n");
        break;
        default:
        break;
    }



    return 0;
}

int MLX90640_I2CGeneralReset(void)
{
	MLX90640_I2CWrite(0x33,0x06,0x00);
	return 0;
}
#endif