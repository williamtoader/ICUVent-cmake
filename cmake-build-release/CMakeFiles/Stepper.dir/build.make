# CMAKE generated file: DO NOT EDIT!
# Generated by "MinGW Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

SHELL = cmd.exe

# The CMake executable.
CMAKE_COMMAND = "C:\Program Files\JetBrains\CLion 201.6668.10\bin\cmake\win\bin\cmake.exe"

# The command to remove a file.
RM = "C:\Program Files\JetBrains\CLion 201.6668.10\bin\cmake\win\bin\cmake.exe" -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = C:\Users\Wiliam\CLionProjects\ICUVent

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = C:\Users\Wiliam\CLionProjects\ICUVent\cmake-build-release

# Include any dependencies generated for this target.
include CMakeFiles/Stepper.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/Stepper.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/Stepper.dir/flags.make

CMakeFiles/Stepper.dir/libs/Stepper/src/Stepper.cpp.obj: CMakeFiles/Stepper.dir/flags.make
CMakeFiles/Stepper.dir/libs/Stepper/src/Stepper.cpp.obj: ../libs/Stepper/src/Stepper.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=C:\Users\Wiliam\CLionProjects\ICUVent\cmake-build-release\CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/Stepper.dir/libs/Stepper/src/Stepper.cpp.obj"
	C:\PROGRA~2\Arduino\hardware\tools\avr\bin\AVR-G_~1.EXE  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles\Stepper.dir\libs\Stepper\src\Stepper.cpp.obj -c C:\Users\Wiliam\CLionProjects\ICUVent\libs\Stepper\src\Stepper.cpp

CMakeFiles/Stepper.dir/libs/Stepper/src/Stepper.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Stepper.dir/libs/Stepper/src/Stepper.cpp.i"
	C:\PROGRA~2\Arduino\hardware\tools\avr\bin\AVR-G_~1.EXE $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E C:\Users\Wiliam\CLionProjects\ICUVent\libs\Stepper\src\Stepper.cpp > CMakeFiles\Stepper.dir\libs\Stepper\src\Stepper.cpp.i

CMakeFiles/Stepper.dir/libs/Stepper/src/Stepper.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Stepper.dir/libs/Stepper/src/Stepper.cpp.s"
	C:\PROGRA~2\Arduino\hardware\tools\avr\bin\AVR-G_~1.EXE $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S C:\Users\Wiliam\CLionProjects\ICUVent\libs\Stepper\src\Stepper.cpp -o CMakeFiles\Stepper.dir\libs\Stepper\src\Stepper.cpp.s

# Object files for target Stepper
Stepper_OBJECTS = \
"CMakeFiles/Stepper.dir/libs/Stepper/src/Stepper.cpp.obj"

# External object files for target Stepper
Stepper_EXTERNAL_OBJECTS =

libStepper.a: CMakeFiles/Stepper.dir/libs/Stepper/src/Stepper.cpp.obj
libStepper.a: CMakeFiles/Stepper.dir/build.make
libStepper.a: CMakeFiles/Stepper.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=C:\Users\Wiliam\CLionProjects\ICUVent\cmake-build-release\CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX static library libStepper.a"
	$(CMAKE_COMMAND) -P CMakeFiles\Stepper.dir\cmake_clean_target.cmake
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles\Stepper.dir\link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/Stepper.dir/build: libStepper.a

.PHONY : CMakeFiles/Stepper.dir/build

CMakeFiles/Stepper.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles\Stepper.dir\cmake_clean.cmake
.PHONY : CMakeFiles/Stepper.dir/clean

CMakeFiles/Stepper.dir/depend:
	$(CMAKE_COMMAND) -E cmake_depends "MinGW Makefiles" C:\Users\Wiliam\CLionProjects\ICUVent C:\Users\Wiliam\CLionProjects\ICUVent C:\Users\Wiliam\CLionProjects\ICUVent\cmake-build-release C:\Users\Wiliam\CLionProjects\ICUVent\cmake-build-release C:\Users\Wiliam\CLionProjects\ICUVent\cmake-build-release\CMakeFiles\Stepper.dir\DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/Stepper.dir/depend

