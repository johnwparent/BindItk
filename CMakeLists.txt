cmake_minimum_required(VERSION 3.15)

project(Bind-ITK CXX)

find_package(Python3 3.5 REQUIRED COMPONENTS Interpreter Development)

# Load autopybind11 binding framework
include(CMake/ExternalAPB.cmake)

set(ITK_DIR "$ENV{ITK_INSTALL_DIR}/lib/cmake/ITK-5.3")
message(STATUS "Searching for ITK")
find_package(ITK REQUIRED)
include(${ITK_USE_FILE})
message(STATUS "ITK found and loaded")


autopybind11_add_module("ITK"
                        YAML_INPUT ${CMAKE_CURRENT_SOURCE_DIR}/wrappers/wrap_itk.yml
                        DESTINATION ${CMAKE_CURRENT_BINARY_DIR}
                        LINK_LIBRARIES ${ITK_LIBRAIRES})
