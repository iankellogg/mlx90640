cmake_minimum_required(VERSION 3.10)
project(MLX90640 VERSION 1.0.0 DESCRIPTION "Driver for interfacing with MLX90640")

set(CMAKE_PREFIX_PATH "/usr/local")
set(CMAKE_C_STANDARD 11)#C11
set(CMAKE_CXX_STANDARD 17)#C17
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(INCLUDE_DIRS "Include" "Include/mlx90640-driver")
INCLUDE_DIRECTORIES(${PROJECT_SOURCE_DIR} ${INCLUDE_DIRS})

file(GLOB_RECURSE INCLUDES "Include/*.h")
file(GLOB_RECURSE SOURCES  "Source/*.c" "Source/*.cpp" "Source/*/*.cpp" "Source/*/*.c")


# Proto file

# CXXFLAGS = -O -g `sdl2-config --cflags --libs` 
# LFLAGS=`sdl2-config --libs` -lSDL2_ttf
# OBJS = main.o libMLX90640_API.a
# INCLUDE += -I ./Include -I ./Include/mlx90640-driver


SET(EXECUTABLE_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/bin) 
SET(CMAKE_CXX_FLAGS "-O3")

find_package(SDL2 REQUIRED SDL2_ttf)
include_directories(${SDL2_INCLUDE_DIRS} ${CMAKE_CURRENT_BINARY_DIR})


find_package(pigpio REQUIRED)
include_directories( ${pigpio_INCLUDE_DIRS} )



add_executable(main main.c  ${SOURCES} ${INCLUDES})
# add_compile_definitions(LV_CONF_INCLUDE_SIMPLE)
target_link_libraries(main PRIVATE SDL2 SDL2_ttf  m  pigpiod_if2 )
add_custom_target (run COMMAND ${EXECUTABLE_OUTPUT_PATH}/main)


file(GLOB_RECURSE LIB_INCLUDES "Include/*.h")
file(GLOB_RECURSE LIB_SOURCES "Source/mlx90640-driver/*.c")
add_library(MLX90640 SHARED ${LIB_SOURCES} ${LIB_INCLUDES})
include(GNUInstallDirs)


set_target_properties(MLX90640 PROPERTIES VERSION ${PROJECT_VERSION})
set_target_properties(MLX90640 PROPERTIES SOVERSION 1)
set_target_properties(MLX90640 PROPERTIES PUBLIC_HEADER Include/MLX90640_API.h)
configure_file(mlx90640.pc.in mlx90640.pc @ONLY)
install(TARGETS MLX90640 LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR} PUBLIC_HEADER DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})
install(FILES ${CMAKE_BINARY_DIR}/mlx90640.pc DESTINATION ${CMAKE_INSTALL_DATAROOTDIR}/pkgconfig)
