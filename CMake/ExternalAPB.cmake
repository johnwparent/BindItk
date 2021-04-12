find_package(AutoPyBind11 REQUIRED)

# install APB
message(STATUS "Found APB")

autopybind11_fetch_build_pybind11(PYBIND11_DIR ${PYBIND11_SOURCE_DIR})
