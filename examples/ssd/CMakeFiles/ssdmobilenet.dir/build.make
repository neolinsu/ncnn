# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.11

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

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/bin/cmake

# The command to remove a file.
RM = /usr/local/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/neolin/Neolinsu/ncnn

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/neolin/Neolinsu/ncnn

# Include any dependencies generated for this target.
include examples/ssd/CMakeFiles/ssdmobilenet.dir/depend.make

# Include the progress variables for this target.
include examples/ssd/CMakeFiles/ssdmobilenet.dir/progress.make

# Include the compile flags for this target's objects.
include examples/ssd/CMakeFiles/ssdmobilenet.dir/flags.make

examples/ssd/CMakeFiles/ssdmobilenet.dir/ssdmobilenet.cpp.o: examples/ssd/CMakeFiles/ssdmobilenet.dir/flags.make
examples/ssd/CMakeFiles/ssdmobilenet.dir/ssdmobilenet.cpp.o: examples/ssd/ssdmobilenet.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/neolin/Neolinsu/ncnn/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object examples/ssd/CMakeFiles/ssdmobilenet.dir/ssdmobilenet.cpp.o"
	cd /home/neolin/Neolinsu/ncnn/examples/ssd && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/ssdmobilenet.dir/ssdmobilenet.cpp.o -c /home/neolin/Neolinsu/ncnn/examples/ssd/ssdmobilenet.cpp

examples/ssd/CMakeFiles/ssdmobilenet.dir/ssdmobilenet.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ssdmobilenet.dir/ssdmobilenet.cpp.i"
	cd /home/neolin/Neolinsu/ncnn/examples/ssd && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/neolin/Neolinsu/ncnn/examples/ssd/ssdmobilenet.cpp > CMakeFiles/ssdmobilenet.dir/ssdmobilenet.cpp.i

examples/ssd/CMakeFiles/ssdmobilenet.dir/ssdmobilenet.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ssdmobilenet.dir/ssdmobilenet.cpp.s"
	cd /home/neolin/Neolinsu/ncnn/examples/ssd && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/neolin/Neolinsu/ncnn/examples/ssd/ssdmobilenet.cpp -o CMakeFiles/ssdmobilenet.dir/ssdmobilenet.cpp.s

# Object files for target ssdmobilenet
ssdmobilenet_OBJECTS = \
"CMakeFiles/ssdmobilenet.dir/ssdmobilenet.cpp.o"

# External object files for target ssdmobilenet
ssdmobilenet_EXTERNAL_OBJECTS =

examples/ssd/ssdmobilenet: examples/ssd/CMakeFiles/ssdmobilenet.dir/ssdmobilenet.cpp.o
examples/ssd/ssdmobilenet: examples/ssd/CMakeFiles/ssdmobilenet.dir/build.make
examples/ssd/ssdmobilenet: src/libncnn.a
examples/ssd/ssdmobilenet: /usr/lib/x86_64-linux-gnu/libopencv_highgui.so.2.4.9
examples/ssd/ssdmobilenet: /usr/lib/x86_64-linux-gnu/libopencv_imgproc.so.2.4.9
examples/ssd/ssdmobilenet: /usr/lib/x86_64-linux-gnu/libopencv_core.so.2.4.9
examples/ssd/ssdmobilenet: examples/ssd/CMakeFiles/ssdmobilenet.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/neolin/Neolinsu/ncnn/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ssdmobilenet"
	cd /home/neolin/Neolinsu/ncnn/examples/ssd && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/ssdmobilenet.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
examples/ssd/CMakeFiles/ssdmobilenet.dir/build: examples/ssd/ssdmobilenet

.PHONY : examples/ssd/CMakeFiles/ssdmobilenet.dir/build

examples/ssd/CMakeFiles/ssdmobilenet.dir/clean:
	cd /home/neolin/Neolinsu/ncnn/examples/ssd && $(CMAKE_COMMAND) -P CMakeFiles/ssdmobilenet.dir/cmake_clean.cmake
.PHONY : examples/ssd/CMakeFiles/ssdmobilenet.dir/clean

examples/ssd/CMakeFiles/ssdmobilenet.dir/depend:
	cd /home/neolin/Neolinsu/ncnn && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/neolin/Neolinsu/ncnn /home/neolin/Neolinsu/ncnn/examples/ssd /home/neolin/Neolinsu/ncnn /home/neolin/Neolinsu/ncnn/examples/ssd /home/neolin/Neolinsu/ncnn/examples/ssd/CMakeFiles/ssdmobilenet.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : examples/ssd/CMakeFiles/ssdmobilenet.dir/depend

