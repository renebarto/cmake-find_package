# - Try to find libQtWebkit
# Once done this will define
#  QT_WEBKIT_FOUND - System has libQtWebkit
#  QT_WEBKITWIDGETS_FOUND - System has libQtWebkitWidgets
#  QTWEBKIT_INCLUDE_DIRS - The libQtWebkit include directories
#  QTWEBKIT_LIBRARIES - The libraries needed to use libQtWebkit
#
# Copyright (C) 2015 Metrological.
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
pkg_check_modules(QT_WEBKIT QUIET Qt5WebKit)
pkg_check_modules(QT_WEBKITWIDGETS QUIET Qt5WebKitWidgets)

set(QTWEBKIT_INCLUDE_DIRS ${QT_WEBKIT_INCLUDE_DIRS} ${QT_WEBKITWIDGETS_INCLUDE_DIRS})
set(QTWEBKIT_LIBRARIES ${QT_WEBKIT_LIBRARIES} ${QT_WEBKITWIDGETS_LIBRARIES})

include(FindPackageHandleStandardArgs)

find_package_handle_standard_args(QT_WEBKIT DEFAULT_MSG QT_WEBKIT_FOUND QT_WEBKITWIDGETS_FOUND)
