# - Try to find Webdriver
# Once done this will define
#  WEBDRIVER_FOUND - System has Libwebdriver
#  WEBDRIVER_INCLUDE_DIRS - The libwebdriver include directories
#  WEBDRIVER_LIBRARIES - The libraries needed to use libwebdriver
#
# Copyright (C) 2016 TATA ELXSI
# Copyright (C) 2016 Metrological.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met:
# 1.  Redistributions of source code must retain the above copyright
#     notice, this list of conditions and the following disclaimer.
# 2.  Redistributions in binary form must reproduce the above copyright
#     notice, this list of conditions and the following disclaimer in the
#     documentation and/or other materials provided with the distribution.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDER AND ITS CONTRIBUTORS ``AS
# IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
# THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
# PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR ITS
# CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
# EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
# PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
# OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
# WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
# OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
# ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

find_package(PkgConfig)
pkg_check_modules(WEBDRIVER_CORE  WebDriver_core)

if (WEBDRIVER_CORE_FOUND)
   set (WEBDRIVER_INCLUDE_DIRS ${WEBDRIVER_INCLUDE_DIRS} ${WEBDRIVER_CORE_INCLUDE_DIRS})
   set (WEBDRIVER_LIBRARIES ${WEBDRIVER_LIBRARIES} ${WEBDRIVER_CORE_LIBRARIES})
   pkg_check_modules(WEBDRIVER_BASE chromium_base)
   if (WEBDRIVER_BASE_FOUND)
       set (WEBDRIVER_INCLUDE_DIRS ${WEBDRIVER_INCLUDE_DIRS} ${WEBDRIVER_BASE_INCLUDE_DIRS})
       set (WEBDRIVER_LIBRARIES ${WEBDRIVER_LIBRARIES} ${WEBDRIVER_BASE_LIBRARIES})
       pkg_check_modules(WEBDRIVER_EXTENSION_WPE_BASE WebDriver_extension_wpe_base)
       if (WEBDRIVER_EXTENSION_WPE_BASE_FOUND)
           set (WEBDRIVER_INCLUDE_DIRS ${WEBDRIVER_INCLUDE_DIRS} ${WEBDRIVER_EXTENSION_WPE_BASE_INCLUDE_DIRS})
           set (WEBDRIVER_LIBRARIES ${WEBDRIVER_LIBRARIES} ${WEBDRIVER_EXTENSION_WPE_BASE_LIBRARIES})
       endif ()
       find_path (GLIB_INCLUDE_DIR glib.h PATHS /usr/include/glib-2.0/)
       set (WEBDRIVER_INCLUDE_DIRS ${GLIB_INCLUDE_DIR})
       find_path (GLIBCONFIG_INCLUDE_DIR glibconfig.h PATHS /usr/lib/glib-2.0/include/)
       set (WEBDRIVER_INCLUDE_DIRS ${GLIB_INCLUDE_DIR} ${GLIBCONFIG_INCLUDE_DIR})
   endif ()
   include(FindPackageHandleStandardArgs)
   FIND_PACKAGE_HANDLE_STANDARD_ARGS(WEBDRIVER DEFAULT_MSG WEBDRIVER_INCLUDE_DIRS WEBDRIVER_LIBRARIES)
endif ()

mark_as_advanced(WEBDRIVER_INCLUDE_DIRS WEBDRIVER_LIBRARIES)
