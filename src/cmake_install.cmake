# Install script for directory: /home/neolin/Neolinsu/ncnn/src

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/neolin/Neolinsu/ncnn/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/home/neolin/Neolinsu/ncnn/src/libncnn.a")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE FILES
    "/home/neolin/Neolinsu/ncnn/src/blob.h"
    "/home/neolin/Neolinsu/ncnn/src/cpu.h"
    "/home/neolin/Neolinsu/ncnn/src/layer.h"
    "/home/neolin/Neolinsu/ncnn/src/layer_type.h"
    "/home/neolin/Neolinsu/ncnn/src/mat.h"
    "/home/neolin/Neolinsu/ncnn/src/modelbin.h"
    "/home/neolin/Neolinsu/ncnn/src/net.h"
    "/home/neolin/Neolinsu/ncnn/src/opencv.h"
    "/home/neolin/Neolinsu/ncnn/src/paramdict.h"
    "/home/neolin/Neolinsu/ncnn/src/benchmark.h"
    "/home/neolin/Neolinsu/ncnn/src/layer_type_enum.h"
    "/home/neolin/Neolinsu/ncnn/src/platform.h"
    )
endif()

