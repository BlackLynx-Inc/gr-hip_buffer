# Copyright 2020 Free Software Foundation, Inc.
#
# This file is part of GNU Radio
#
# SPDX-License-Identifier: GPL-3.0-or-later
#

########################################################################
# Check if there is C++ code at all
########################################################################
if(NOT hip_buffer_sources)
    MESSAGE(STATUS "No C++ sources... skipping python bindings")
    return()
endif(NOT hip_buffer_sources)

########################################################################
# Check for pygccxml
########################################################################
GR_PYTHON_CHECK_MODULE_RAW(
    "pygccxml"
    "import pygccxml"
    PYGCCXML_FOUND
    )

include(GrPybind)

########################################################################
# Python Bindings
########################################################################

list(APPEND hip_buffer_python_files
    python_bindings.cc)

GR_PYBIND_MAKE_OOT(hip_buffer 
   ../..
   gr::hip_buffer
   "${hip_buffer_python_files}")

install(TARGETS hip_buffer_python DESTINATION ${GR_PYTHON_DIR}/hip_buffer COMPONENT pythonapi)
