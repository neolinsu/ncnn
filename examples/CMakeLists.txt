
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/../src)
include_directories(${CMAKE_CURRENT_BINARY_DIR}/../src)
if(AARCH64)
	find_package(QUIET COMPONENTS)
	
	add_executable(tester tester.cpp)
	target_link_libraries(tester ncnn)
elseif()

	find_package(OpenCV QUIET COMPONENTS core highgui imgproc imgcodecs)
	if(NOT OpenCV_FOUND)
    		find_package(OpenCV REQUIRED COMPONENTS core highgui imgproc)
	endif()
	add_executable(squeezenet squeezenet.cpp)
	target_link_libraries(squeezenet ncnn ${OpenCV_LIBS})

	add_executable(fasterrcnn fasterrcnn.cpp)
	target_link_libraries(fasterrcnn ncnn ${OpenCV_LIBS})

	add_subdirectory(ssd)
endif()
