cmake_minimum_required(VERSION 2.8.4)

set(CMAKE_TOOLCHAIN_FILE ${CMAKE_SOURCE_DIR}/cmake/ArduinoToolchain.cmake)
set(CMAKE_CXX_STANDARD 11)
set(PROJECT_NAME ICUVent)

## We use flag -Os to optimize for smaller binary size
set(ARDUINO_C_FLAGS      "-ffunction-sections -fdata-sections -Os")
set(ARDUINO_CXX_FLAGS    "${ARDUINO_C_FLAGS} -fno-exceptions")
set(ARDUINO_LINKER_FLAGS "-Wl,--gc-sections")


set(${PROJECT_NAME}_BOARD uno)
# set(ARDUINO_CPU)
project(${PROJECT_NAME} C CXX)

# Define additional source and header files or default arduino sketch files
# set(${PROJECT_NAME}_SRCS)
# set(${PROJECT_NAME}_HDRS)

### Additional static libraries to include in the target.
# set(${PROJECT_NAME}_LIBS)

generate_arduino_library(Wire
        BOARD ${${PROJECT_NAME}_BOARD}
        SRCS libs/Wire/src/Wire.cpp
        HDRS libs/Wire/src/Wire.h
        LIBS)

generate_arduino_library(Stepper
        BOARD ${${PROJECT_NAME}_BOARD}
        SRCS libs/Stepper/src/Stepper.cpp
        HDRS libs/Stepper/src/Stepper.h
        LIBS)

generate_arduino_library(ICUVentLib
        BOARD ${${PROJECT_NAME}_BOARD}
        SRCS libs/ICUVentLibs/Menu.cpp libs/ICUVentLibs/Functions.cpp
        HDRS libs/ICUVentLibs/ICUVentLibs.h
        LIBS Wire Stepper
        )

generate_arduino_library(LiquidCrystal_I2C
        BOARD ${${PROJECT_NAME}_BOARD}
        SRCS libs/LiquidCrystal_I2C/LiquidCrystal_I2C.cpp
        HDRS libs/LiquidCrystal_I2C/LiquidCrystal_I2C.h
        LIBS Wire)


#add_subdirectory(libs/ST7565)
add_subdirectory(libs/EEPROMAnything)
add_subdirectory(libs/Button2)

### Main sketch file
set(${PROJECT_NAME}_LIBS ICUVentLib)
set(${PROJECT_NAME}_ARDLIBS)
set(${PROJECT_NAME}_SKETCH main.ino)


### Add project directories into the build
link_directories(${CMAKE_CURRENT_SOURCE_DIR}/libs)


### Additional settings to add non-standard or your own Arduino libraries.
# For this example (libs will contain additional arduino libraries)
# An Arduino library my_lib will contain files in libs/my_lib/: my_lib.h, my_lib.cpp + any other cpp files


# For nested library sources replace ${LIB_NAME} with library name for each library
# set(_RECURSE true)

#### Additional settings for programmer. From programmers.txt
# set(${PROJECT_NAME}_PROGRAMMER avrispmkii)
set(${PROJECT_NAME}_PORT COM6)
# set(uno.upload.speed 9600)

## Verbose build process
set(${PROJECT_NAME}_AFLAGS -v)

generate_arduino_firmware(${PROJECT_NAME})


##print_board_list()
##print_programmer_list()
