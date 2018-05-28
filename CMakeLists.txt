
if(CMAKE_TOOLCHAIN_FILE)
set(LIBRARY_OUTPUT_PATH_ROOT ${CMAKE_BINARY_DIR} CACHE PATH "root for library output, set this to change where android libs are compiled to")
# get absolute path, but get_filename_component ABSOLUTE only refer with source dir, so find_file here :(
get_filename_component(CMAKE_TOOLCHAIN_FILE_NAME ${CMAKE_TOOLCHAIN_FILE} NAME)
find_file(CMAKE_TOOLCHAIN_FILE ${CMAKE_TOOLCHAIN_FILE_NAME} PATHS ${CMAKE_SOURCE_DIR} NO_DEFAULT_PATH)
message(STATUS "CMAKE_TOOLCHAIN_FILE = ${CMAKE_TOOLCHAIN_FILE}")
endif()

if(NOT DEFINED CMAKE_INSTALL_PREFIX)
set(CMAKE_INSTALL_PREFIX "${CMAKE_BINARY_DIR}/install" CACHE PATH "Installation Directory")
endif()
message(STATUS "CMAKE_INSTALL_PREFIX = ${CMAKE_INSTALL_PREFIX}")

cmake_minimum_required(VERSION 2.8.10)

if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE release CACHE STRING "Choose the type of build" FORCE)
endif()

project(ncnn)

option(NCNN_OPENMP "openmp support" ON)
option(NCNN_STDIO "load model from external file" ON)
option(NCNN_STRING "plain and verbose string" ON)
option(NCNN_OPENCV "minimal opencv structure emulation" OFF)
option(NCNN_BENCHMARK "print benchmark information for every layer" ON) #DIFFERENT

if(NCNN_OPENMP)
    find_package(OpenMP)
    if(OpenMP_CXX_FOUND OR OPENMP_FOUND)
        set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${OpenMP_C_FLAGS}")
        set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${OpenMP_CXX_FLAGS}")
    endif()
endif()

if(WIN32)
    add_definitions(-D_SCL_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE)
else()
    add_definitions(-Wall -Wextra -Wno-unused-function)

    if(CMAKE_BUILD_TYPE MATCHES "(Release|RELEASE|release)")
        add_definitions(-fPIC)
        add_definitions(-Ofast)

        add_definitions(-ffast-math)
    endif()
    # add_definitions(-march=native)

    # add_definitions(-flto)

    add_definitions(-fvisibility=hidden -fvisibility-inlines-hidden)
endif()
if(AARCH64)
	set(CMAKE_SYSTEM_NAME Linux)
	set(CMAKE_SYSTEM_PROCESSOR aarch64)
	set(TARGET_ABI "linux-gnu")
	# specify the cross compiler
	SET(CMAKE_C_COMPILER   aarch64-${TARGET_ABI}-gcc)
	SET(CMAKE_CXX_COMPILER aarch64-${TARGET_ABI}-g++)

	# To build the tests, we need to set where the target environment containing
	# the required library is. On Debian-like systems, this is
	# /usr/aarch64-linux-gnu.
	SET(CMAKE_FIND_ROOT_PATH "/usr/aarch64-${TARGET_ABI}")
	# search for programs in the build host directories
	SET(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
	# for libraries and headers in the target directories
	SET(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
	SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

	# Set additional variables.
	# If we don't set some of these, CMake will end up using the host version.
	# We want the full path, however, so we can pass EXISTS and other checks in
	# the our CMake code.
	find_program(GCC_FULL_PATH aarch64-${TARGET_ABI}-gcc)
	if (NOT GCC_FULL_PATH)
		  message(FATAL_ERROR "Cross-compiler aarch64-${TARGET_ABI}-gcc not found")
	  endif ()
	  get_filename_component(GCC_DIR ${GCC_FULL_PATH} PATH)
	  SET(CMAKE_LINKER       ${GCC_DIR}/aarch64-${TARGET_ABI}-ld      CACHE FILEPATH "linker")
	  SET(CMAKE_ASM_COMPILER ${GCC_DIR}/aarch64-${TARGET_ABI}-as      CACHE FILEPATH "assembler")
	  SET(CMAKE_OBJCOPY      ${GCC_DIR}/aarch64-${TARGET_ABI}-objcopy CACHE FILEPATH "objcopy")
	  SET(CMAKE_STRIP        ${GCC_DIR}/aarch64-${TARGET_ABI}-strip   CACHE FILEPATH "strip")
	  SET(CMAKE_CPP          ${GCC_DIR}/aarch64-${TARGET_ABI}-cpp     CACHE FILEPATH "cpp")

endif()
if(ANDROID) #ANDROID or IOS WITH AARCH64 has not been tested
    # disable shared library on android
    set_property(GLOBAL PROPERTY TARGET_SUPPORTS_SHARED_LIBS FALSE)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fno-rtti -fno-exceptions")
elseif(IOS)
    # disable shared library on xcode ios
    set_property(GLOBAL PROPERTY TARGET_SUPPORTS_SHARED_LIBS FALSE)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fno-rtti -fno-exceptions")
endif()

##############################################

add_subdirectory(examples) #DIFF
# add_subdirectory(benchmark)
add_subdirectory(src)
if(NOT ANDROID AND NOT IOS AND NOT AARCH64)
add_subdirectory(tools)
endif()
