if(NOT PKG_CONFIG_FOUND)
    INCLUDE(FindPkgConfig)
endif()
PKG_CHECK_MODULES(PC_HIP_BUFFER hip_buffer)

FIND_PATH(
    HIP_BUFFER_INCLUDE_DIRS
    NAMES hip_buffer/api.h
    HINTS $ENV{HIP_BUFFER_DIR}/include
        ${PC_HIP_BUFFER_INCLUDEDIR}
    PATHS ${CMAKE_INSTALL_PREFIX}/include
          /usr/local/include
          /usr/include
)

FIND_LIBRARY(
    HIP_BUFFER_LIBRARIES
    NAMES gnuradio-hip_buffer
    HINTS $ENV{HIP_BUFFER_DIR}/lib
        ${PC_HIP_BUFFER_LIBDIR}
    PATHS ${CMAKE_INSTALL_PREFIX}/lib
          ${CMAKE_INSTALL_PREFIX}/lib64
          /usr/local/lib
          /usr/local/lib64
          /usr/lib
          /usr/lib64
          )

#include("${CMAKE_CURRENT_LIST_DIR}/hip_bufferTarget.cmake")

INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(HIP_BUFFER DEFAULT_MSG HIP_BUFFER_LIBRARIES HIP_BUFFER_INCLUDE_DIRS)
MARK_AS_ADVANCED(HIP_BUFFER_LIBRARIES HIP_BUFFER_INCLUDE_DIRS)
