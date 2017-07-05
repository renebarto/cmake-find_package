# - Try to Find libnl
#
# Copyright (C) 2017 Rene Barto
#
# Distributed under the Boost Software License, Version 1.0.
# (See accompanying file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)
#
# Will be defined:
# LIBNL_FOUND
# LIBNL_INCLUDE_DIR
# LIBNL_LIBRARIES
#

find_package(PkgConfig)
pkg_check_modules(PC_LIBNL QUIET libnl-3.0)

if(PC_LIBNL_FOUND)
    if(LibNL_FIND_VERSION AND PC_LIBNL_VERSION)
        if ("${LibNL_FIND_VERSION}" VERSION_GREATER "${PC_LIBNL_VERSION}")
            message(WARNING "Incorrect version, found ${PC_LIBNL_VERSION}, need at least ${LibNL_FIND_VERSION}, please install libnl-${LibNL_FIND_VERSION}")
            set(LIBNL_FOUND_TEXT "Found incorrect version")
            unset(PC_LIBNL_FOUND)
        endif()
    endif()
else()
    set(LIBNL_FOUND_TEXT "Not found")
endif()

if(PC_LIBNL_FOUND)
    find_path(LIBNL_INCLUDE_DIRS NAMES netlink/netlink.h
        HINTS ${PC_LIBNL_INCLUDE_DIRS})

    set(LIBNL_LIBRARY )
    foreach(LIB ${PC_LIBNL_LIBRARIES})
        find_library(LIBNL_LIBRARY_${LIB} NAMES ${LIB}
            HINTS ${PC_LIBNL_LIBDIR} ${PC_LIBNL_LIBRARY_DIRS})
        list(APPEND LIBNL_LIBRARY ${LIBNL_LIBRARY_${LIB}})
    endforeach()

    if("${LIBNL_INCLUDE_DIRS}" STREQUAL "" OR "${LIBNL_LIBRARY}" STREQUAL "")
        set(LIBNL_FOUND_TEXT "Not found")
    else()
        set(LIBNL_FOUND_TEXT "Found")
    endif()
else()
    set(LIBNL_FOUND_TEXT "Not found")
endif()

message(STATUS "libnl          : ${LIBNL_FOUND_TEXT}")
message(STATUS "  version      : ${PC_LIBNL_VERSION}")
message(STATUS "  cflags       : ${PC_LIBNL_CFLAGS}")
message(STATUS "  cflags other : ${PC_LIBNL_CFLAGS_OTHER}")
message(STATUS "  include dirs : ${PC_LIBNL_INCLUDE_DIRS}")
message(STATUS "  lib dirs     : ${PC_LIBNL_LIBRARY_DIRS}")
message(STATUS "  include dirs : ${LIBNL_INCLUDE_DIRS}")
message(STATUS "  libs         : ${LIBNL_LIBRARY}")

set(LIBNL_DEFINITIONS ${PC_LIBNL_CFLAGS_OTHER})
set(LIBNL_INCLUDE_DIR ${LIBNL_INCLUDE_DIRS})
set(LIBNL_LIBRARIES ${LIBNL_LIBRARY})
set(LIBNL_LIBRARY_DIRS ${PC_LIBNL_LIBRARY_DIRS})

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(LIBNL DEFAULT_MSG
    LIBNL_LIBRARIES LIBNL_INCLUDE_DIRS)

if(LIBNL_FOUND)
else()
    message(WARNING "Could not find libnl-3, please install: sudo apt install libnl-3-dev")
endif()

mark_as_advanced(LIBNL_DEFINITIONS LIBNL_INCLUDE_DIRS LIBNL_LIBRARIES)
