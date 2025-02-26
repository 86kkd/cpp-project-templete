cmake_minimum_required(VERSION 3.24)

# 生成 compile_commands.json 文件，用于 clangd 的索引
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
project(hello_world)
find_package(OpenCV REQUIRED core imgproc highgui)

add_executable(hello_world main.cpp)

# compile the custom obj
add_library(sub sub.cpp)

# link the system obj and custom obj target_link_libraries(hello_world PUBLIC
# sub "/usr/lib/libopencv_core.so" "/usr/lib/libopencv_highgui.so"
# "/usr/lib/libopencv_imgproc.so")
target_link_libraries(hello_world PUBLIC sub ${OpenCV_LIBS})

# 添加 OpenCV 的头文件路径
target_include_directories(hello_world
                           PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/include)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED True)
