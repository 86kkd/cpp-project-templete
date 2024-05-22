cmake_minimum_required(VERSION 3.29.3)

project(hello_world)

add_executable(hello_world main.cpp)

# compile the custom obj
add_library(sub sub.cpp)
# add_subdirectory(sub)

# link the system obj and custom obj
target_link_libraries(hello_world PUBLIC sub
                     "/usr/lib/libopencv_core.so"
                     "/usr/lib/libopencv_highgui.so"
                     "/usr/lib/libopencv_imgproc.so")


target_include_directories(hello_world PUBLIC
                          "/usr/include/opencv4"
                          )

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED True)
