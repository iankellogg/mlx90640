# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.18

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Disable VCS-based implicit rules.
% : %,v


# Disable VCS-based implicit rules.
% : RCS/%


# Disable VCS-based implicit rules.
% : RCS/%,v


# Disable VCS-based implicit rules.
% : SCCS/s.%


# Disable VCS-based implicit rules.
% : s.%


.SUFFIXES: .hpux_make_needs_suffix_list


# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/cannon/RaspberryPi/cpp

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/cannon/RaspberryPi/cpp/build

# Include any dependencies generated for this target.
include CMakeFiles/main.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/main.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/main.dir/flags.make

CMakeFiles/main.dir/main.c.o: CMakeFiles/main.dir/flags.make
CMakeFiles/main.dir/main.c.o: ../main.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/cannon/RaspberryPi/cpp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/main.dir/main.c.o"
	/bin/gcc-10 $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/main.dir/main.c.o -c /home/cannon/RaspberryPi/cpp/main.c

CMakeFiles/main.dir/main.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/main.dir/main.c.i"
	/bin/gcc-10 $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/cannon/RaspberryPi/cpp/main.c > CMakeFiles/main.dir/main.c.i

CMakeFiles/main.dir/main.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/main.dir/main.c.s"
	/bin/gcc-10 $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/cannon/RaspberryPi/cpp/main.c -o CMakeFiles/main.dir/main.c.s

CMakeFiles/main.dir/Source/mlx90640-driver/MLX90640_API.c.o: CMakeFiles/main.dir/flags.make
CMakeFiles/main.dir/Source/mlx90640-driver/MLX90640_API.c.o: ../Source/mlx90640-driver/MLX90640_API.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/cannon/RaspberryPi/cpp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/main.dir/Source/mlx90640-driver/MLX90640_API.c.o"
	/bin/gcc-10 $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/main.dir/Source/mlx90640-driver/MLX90640_API.c.o -c /home/cannon/RaspberryPi/cpp/Source/mlx90640-driver/MLX90640_API.c

CMakeFiles/main.dir/Source/mlx90640-driver/MLX90640_API.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/main.dir/Source/mlx90640-driver/MLX90640_API.c.i"
	/bin/gcc-10 $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/cannon/RaspberryPi/cpp/Source/mlx90640-driver/MLX90640_API.c > CMakeFiles/main.dir/Source/mlx90640-driver/MLX90640_API.c.i

CMakeFiles/main.dir/Source/mlx90640-driver/MLX90640_API.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/main.dir/Source/mlx90640-driver/MLX90640_API.c.s"
	/bin/gcc-10 $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/cannon/RaspberryPi/cpp/Source/mlx90640-driver/MLX90640_API.c -o CMakeFiles/main.dir/Source/mlx90640-driver/MLX90640_API.c.s

CMakeFiles/main.dir/Source/mlx90640-driver/MLX90640_I2C_Driver.c.o: CMakeFiles/main.dir/flags.make
CMakeFiles/main.dir/Source/mlx90640-driver/MLX90640_I2C_Driver.c.o: ../Source/mlx90640-driver/MLX90640_I2C_Driver.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/cannon/RaspberryPi/cpp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object CMakeFiles/main.dir/Source/mlx90640-driver/MLX90640_I2C_Driver.c.o"
	/bin/gcc-10 $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/main.dir/Source/mlx90640-driver/MLX90640_I2C_Driver.c.o -c /home/cannon/RaspberryPi/cpp/Source/mlx90640-driver/MLX90640_I2C_Driver.c

CMakeFiles/main.dir/Source/mlx90640-driver/MLX90640_I2C_Driver.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/main.dir/Source/mlx90640-driver/MLX90640_I2C_Driver.c.i"
	/bin/gcc-10 $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/cannon/RaspberryPi/cpp/Source/mlx90640-driver/MLX90640_I2C_Driver.c > CMakeFiles/main.dir/Source/mlx90640-driver/MLX90640_I2C_Driver.c.i

CMakeFiles/main.dir/Source/mlx90640-driver/MLX90640_I2C_Driver.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/main.dir/Source/mlx90640-driver/MLX90640_I2C_Driver.c.s"
	/bin/gcc-10 $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/cannon/RaspberryPi/cpp/Source/mlx90640-driver/MLX90640_I2C_Driver.c -o CMakeFiles/main.dir/Source/mlx90640-driver/MLX90640_I2C_Driver.c.s

CMakeFiles/main.dir/Source/mlx90640-driver/MLX90640_LINUX_I2C_Driver.c.o: CMakeFiles/main.dir/flags.make
CMakeFiles/main.dir/Source/mlx90640-driver/MLX90640_LINUX_I2C_Driver.c.o: ../Source/mlx90640-driver/MLX90640_LINUX_I2C_Driver.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/cannon/RaspberryPi/cpp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building C object CMakeFiles/main.dir/Source/mlx90640-driver/MLX90640_LINUX_I2C_Driver.c.o"
	/bin/gcc-10 $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/main.dir/Source/mlx90640-driver/MLX90640_LINUX_I2C_Driver.c.o -c /home/cannon/RaspberryPi/cpp/Source/mlx90640-driver/MLX90640_LINUX_I2C_Driver.c

CMakeFiles/main.dir/Source/mlx90640-driver/MLX90640_LINUX_I2C_Driver.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/main.dir/Source/mlx90640-driver/MLX90640_LINUX_I2C_Driver.c.i"
	/bin/gcc-10 $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/cannon/RaspberryPi/cpp/Source/mlx90640-driver/MLX90640_LINUX_I2C_Driver.c > CMakeFiles/main.dir/Source/mlx90640-driver/MLX90640_LINUX_I2C_Driver.c.i

CMakeFiles/main.dir/Source/mlx90640-driver/MLX90640_LINUX_I2C_Driver.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/main.dir/Source/mlx90640-driver/MLX90640_LINUX_I2C_Driver.c.s"
	/bin/gcc-10 $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/cannon/RaspberryPi/cpp/Source/mlx90640-driver/MLX90640_LINUX_I2C_Driver.c -o CMakeFiles/main.dir/Source/mlx90640-driver/MLX90640_LINUX_I2C_Driver.c.s

CMakeFiles/main.dir/Source/mlx90640-driver/MLX90640_PIGPIO_I2C_Driver.c.o: CMakeFiles/main.dir/flags.make
CMakeFiles/main.dir/Source/mlx90640-driver/MLX90640_PIGPIO_I2C_Driver.c.o: ../Source/mlx90640-driver/MLX90640_PIGPIO_I2C_Driver.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/cannon/RaspberryPi/cpp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building C object CMakeFiles/main.dir/Source/mlx90640-driver/MLX90640_PIGPIO_I2C_Driver.c.o"
	/bin/gcc-10 $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/main.dir/Source/mlx90640-driver/MLX90640_PIGPIO_I2C_Driver.c.o -c /home/cannon/RaspberryPi/cpp/Source/mlx90640-driver/MLX90640_PIGPIO_I2C_Driver.c

CMakeFiles/main.dir/Source/mlx90640-driver/MLX90640_PIGPIO_I2C_Driver.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/main.dir/Source/mlx90640-driver/MLX90640_PIGPIO_I2C_Driver.c.i"
	/bin/gcc-10 $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/cannon/RaspberryPi/cpp/Source/mlx90640-driver/MLX90640_PIGPIO_I2C_Driver.c > CMakeFiles/main.dir/Source/mlx90640-driver/MLX90640_PIGPIO_I2C_Driver.c.i

CMakeFiles/main.dir/Source/mlx90640-driver/MLX90640_PIGPIO_I2C_Driver.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/main.dir/Source/mlx90640-driver/MLX90640_PIGPIO_I2C_Driver.c.s"
	/bin/gcc-10 $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/cannon/RaspberryPi/cpp/Source/mlx90640-driver/MLX90640_PIGPIO_I2C_Driver.c -o CMakeFiles/main.dir/Source/mlx90640-driver/MLX90640_PIGPIO_I2C_Driver.c.s

CMakeFiles/main.dir/Source/mlx90640-driver/MLX90640_SWI2C_Driver.c.o: CMakeFiles/main.dir/flags.make
CMakeFiles/main.dir/Source/mlx90640-driver/MLX90640_SWI2C_Driver.c.o: ../Source/mlx90640-driver/MLX90640_SWI2C_Driver.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/cannon/RaspberryPi/cpp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building C object CMakeFiles/main.dir/Source/mlx90640-driver/MLX90640_SWI2C_Driver.c.o"
	/bin/gcc-10 $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/main.dir/Source/mlx90640-driver/MLX90640_SWI2C_Driver.c.o -c /home/cannon/RaspberryPi/cpp/Source/mlx90640-driver/MLX90640_SWI2C_Driver.c

CMakeFiles/main.dir/Source/mlx90640-driver/MLX90640_SWI2C_Driver.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/main.dir/Source/mlx90640-driver/MLX90640_SWI2C_Driver.c.i"
	/bin/gcc-10 $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/cannon/RaspberryPi/cpp/Source/mlx90640-driver/MLX90640_SWI2C_Driver.c > CMakeFiles/main.dir/Source/mlx90640-driver/MLX90640_SWI2C_Driver.c.i

CMakeFiles/main.dir/Source/mlx90640-driver/MLX90640_SWI2C_Driver.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/main.dir/Source/mlx90640-driver/MLX90640_SWI2C_Driver.c.s"
	/bin/gcc-10 $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/cannon/RaspberryPi/cpp/Source/mlx90640-driver/MLX90640_SWI2C_Driver.c -o CMakeFiles/main.dir/Source/mlx90640-driver/MLX90640_SWI2C_Driver.c.s

# Object files for target main
main_OBJECTS = \
"CMakeFiles/main.dir/main.c.o" \
"CMakeFiles/main.dir/Source/mlx90640-driver/MLX90640_API.c.o" \
"CMakeFiles/main.dir/Source/mlx90640-driver/MLX90640_I2C_Driver.c.o" \
"CMakeFiles/main.dir/Source/mlx90640-driver/MLX90640_LINUX_I2C_Driver.c.o" \
"CMakeFiles/main.dir/Source/mlx90640-driver/MLX90640_PIGPIO_I2C_Driver.c.o" \
"CMakeFiles/main.dir/Source/mlx90640-driver/MLX90640_SWI2C_Driver.c.o"

# External object files for target main
main_EXTERNAL_OBJECTS =

../bin/main: CMakeFiles/main.dir/main.c.o
../bin/main: CMakeFiles/main.dir/Source/mlx90640-driver/MLX90640_API.c.o
../bin/main: CMakeFiles/main.dir/Source/mlx90640-driver/MLX90640_I2C_Driver.c.o
../bin/main: CMakeFiles/main.dir/Source/mlx90640-driver/MLX90640_LINUX_I2C_Driver.c.o
../bin/main: CMakeFiles/main.dir/Source/mlx90640-driver/MLX90640_PIGPIO_I2C_Driver.c.o
../bin/main: CMakeFiles/main.dir/Source/mlx90640-driver/MLX90640_SWI2C_Driver.c.o
../bin/main: CMakeFiles/main.dir/build.make
../bin/main: CMakeFiles/main.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/cannon/RaspberryPi/cpp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Linking C executable ../bin/main"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/main.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/main.dir/build: ../bin/main

.PHONY : CMakeFiles/main.dir/build

CMakeFiles/main.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/main.dir/cmake_clean.cmake
.PHONY : CMakeFiles/main.dir/clean

CMakeFiles/main.dir/depend:
	cd /home/cannon/RaspberryPi/cpp/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/cannon/RaspberryPi/cpp /home/cannon/RaspberryPi/cpp /home/cannon/RaspberryPi/cpp/build /home/cannon/RaspberryPi/cpp/build /home/cannon/RaspberryPi/cpp/build/CMakeFiles/main.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/main.dir/depend

