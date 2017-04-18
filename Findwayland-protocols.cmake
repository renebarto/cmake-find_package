# - Find wayland-protocols
# Find the wayland-protocols libraries
#
#  This module defines the following variables:
#     WAYLAND_PROTOCOLS_FOUND        - true if WAYLAND_PROTOCOLS_VERSION & WAYLAND_PROTOCOLS_PKGDATADIR are found
#     WAYLAND_PROTOCOLS_PKGDATADIR   - Set when WAYLAND_PROTOCOLS pkgconfig data is found
#     WAYLAND_PROTOCOLS_VERSION - Set when WAYLAND_PROTOCOLS is found
#

find_package(PkgConfig)

pkg_check_modules(WaylandProtocols QUIET wayland-protocols>=${WaylandProtocols_FIND_VERSION})

execute_process(COMMAND ${PKG_CONFIG_EXECUTABLE} --variable=pkgdatadir wayland-protocols
        OUTPUT_VARIABLE WaylandProtocols_PKGDATADIR
        RESULT_VARIABLE _pkgconfig_failed)
if (_pkgconfig_failed)
    message(FATAL_ERROR "Missing wayland-protocols pkgdatadir")
endif()

string(REGEX REPLACE "[\r\n]" "" WaylandProtocols_PKGDATADIR "${WaylandProtocols_PKGDATADIR}")

find_package_handle_standard_args(WaylandProtocols
        FOUND_VAR
        WaylandProtocols_FOUND
        REQUIRED_VARS
        WaylandProtocols_PKGDATADIR
        VERSION_VAR
        WaylandProtocols_VERSION
        HANDLE_COMPONENTS
        )

set(WAYLAND_PROTOCOLS_FOUND ${WaylandProtocols_FOUND})
set(WAYLAND_PROTOCOLS_PKGDATADIR ${WaylandProtocols_PKGDATADIR})
set(WAYLAND_PROTOCOLS_VERSION ${WaylandProtocols_VERSION})