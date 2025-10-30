# Install script for directory: /home/dethfo/e_port_folio/SDL

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "RelWithDebInfo")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/usr/bin/objdump")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/dethfo/e_port_folio/SDL/build/sdl3.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libSDL3.so.0.3.3"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libSDL3.so.0"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      file(RPATH_CHECK
           FILE "${file}"
           RPATH "")
    endif()
  endforeach()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES
    "/home/dethfo/e_port_folio/SDL/build/libSDL3.so.0.3.3"
    "/home/dethfo/e_port_folio/SDL/build/libSDL3.so.0"
    )
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libSDL3.so.0.3.3"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libSDL3.so.0"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      if(CMAKE_INSTALL_DO_STRIP)
        execute_process(COMMAND "/usr/bin/strip" "${file}")
      endif()
    endif()
  endforeach()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/dethfo/e_port_folio/SDL/build/libSDL3.so")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/home/dethfo/e_port_folio/SDL/build/libSDL3_test.a")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/SDL3/SDL3headersTargets.cmake")
    file(DIFFERENT _cmake_export_file_changed FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/SDL3/SDL3headersTargets.cmake"
         "/home/dethfo/e_port_folio/SDL/build/CMakeFiles/Export/35815d1d52a6ea1175d74784b559bdb6/SDL3headersTargets.cmake")
    if(_cmake_export_file_changed)
      file(GLOB _cmake_old_config_files "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/SDL3/SDL3headersTargets-*.cmake")
      if(_cmake_old_config_files)
        string(REPLACE ";" ", " _cmake_old_config_files_text "${_cmake_old_config_files}")
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/SDL3/SDL3headersTargets.cmake\" will be replaced.  Removing files [${_cmake_old_config_files_text}].")
        unset(_cmake_old_config_files_text)
        file(REMOVE ${_cmake_old_config_files})
      endif()
      unset(_cmake_old_config_files)
    endif()
    unset(_cmake_export_file_changed)
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/SDL3" TYPE FILE FILES "/home/dethfo/e_port_folio/SDL/build/CMakeFiles/Export/35815d1d52a6ea1175d74784b559bdb6/SDL3headersTargets.cmake")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/SDL3/SDL3sharedTargets.cmake")
    file(DIFFERENT _cmake_export_file_changed FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/SDL3/SDL3sharedTargets.cmake"
         "/home/dethfo/e_port_folio/SDL/build/CMakeFiles/Export/35815d1d52a6ea1175d74784b559bdb6/SDL3sharedTargets.cmake")
    if(_cmake_export_file_changed)
      file(GLOB _cmake_old_config_files "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/SDL3/SDL3sharedTargets-*.cmake")
      if(_cmake_old_config_files)
        string(REPLACE ";" ", " _cmake_old_config_files_text "${_cmake_old_config_files}")
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/SDL3/SDL3sharedTargets.cmake\" will be replaced.  Removing files [${_cmake_old_config_files_text}].")
        unset(_cmake_old_config_files_text)
        file(REMOVE ${_cmake_old_config_files})
      endif()
      unset(_cmake_old_config_files)
    endif()
    unset(_cmake_export_file_changed)
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/SDL3" TYPE FILE FILES "/home/dethfo/e_port_folio/SDL/build/CMakeFiles/Export/35815d1d52a6ea1175d74784b559bdb6/SDL3sharedTargets.cmake")
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/SDL3" TYPE FILE FILES "/home/dethfo/e_port_folio/SDL/build/CMakeFiles/Export/35815d1d52a6ea1175d74784b559bdb6/SDL3sharedTargets-relwithdebinfo.cmake")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/SDL3/SDL3testTargets.cmake")
    file(DIFFERENT _cmake_export_file_changed FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/SDL3/SDL3testTargets.cmake"
         "/home/dethfo/e_port_folio/SDL/build/CMakeFiles/Export/35815d1d52a6ea1175d74784b559bdb6/SDL3testTargets.cmake")
    if(_cmake_export_file_changed)
      file(GLOB _cmake_old_config_files "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/SDL3/SDL3testTargets-*.cmake")
      if(_cmake_old_config_files)
        string(REPLACE ";" ", " _cmake_old_config_files_text "${_cmake_old_config_files}")
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/SDL3/SDL3testTargets.cmake\" will be replaced.  Removing files [${_cmake_old_config_files_text}].")
        unset(_cmake_old_config_files_text)
        file(REMOVE ${_cmake_old_config_files})
      endif()
      unset(_cmake_old_config_files)
    endif()
    unset(_cmake_export_file_changed)
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/SDL3" TYPE FILE FILES "/home/dethfo/e_port_folio/SDL/build/CMakeFiles/Export/35815d1d52a6ea1175d74784b559bdb6/SDL3testTargets.cmake")
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/SDL3" TYPE FILE FILES "/home/dethfo/e_port_folio/SDL/build/CMakeFiles/Export/35815d1d52a6ea1175d74784b559bdb6/SDL3testTargets-relwithdebinfo.cmake")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/SDL3" TYPE FILE FILES
    "/home/dethfo/e_port_folio/SDL/build/SDL3Config.cmake"
    "/home/dethfo/e_port_folio/SDL/build/SDL3ConfigVersion.cmake"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/SDL3" TYPE FILE FILES
    "/home/dethfo/e_port_folio/SDL/include/SDL3/SDL.h"
    "/home/dethfo/e_port_folio/SDL/include/SDL3/SDL_assert.h"
    "/home/dethfo/e_port_folio/SDL/include/SDL3/SDL_asyncio.h"
    "/home/dethfo/e_port_folio/SDL/include/SDL3/SDL_atomic.h"
    "/home/dethfo/e_port_folio/SDL/include/SDL3/SDL_audio.h"
    "/home/dethfo/e_port_folio/SDL/include/SDL3/SDL_begin_code.h"
    "/home/dethfo/e_port_folio/SDL/include/SDL3/SDL_bits.h"
    "/home/dethfo/e_port_folio/SDL/include/SDL3/SDL_blendmode.h"
    "/home/dethfo/e_port_folio/SDL/include/SDL3/SDL_camera.h"
    "/home/dethfo/e_port_folio/SDL/include/SDL3/SDL_clipboard.h"
    "/home/dethfo/e_port_folio/SDL/include/SDL3/SDL_close_code.h"
    "/home/dethfo/e_port_folio/SDL/include/SDL3/SDL_copying.h"
    "/home/dethfo/e_port_folio/SDL/include/SDL3/SDL_cpuinfo.h"
    "/home/dethfo/e_port_folio/SDL/include/SDL3/SDL_dialog.h"
    "/home/dethfo/e_port_folio/SDL/include/SDL3/SDL_dlopennote.h"
    "/home/dethfo/e_port_folio/SDL/include/SDL3/SDL_egl.h"
    "/home/dethfo/e_port_folio/SDL/include/SDL3/SDL_endian.h"
    "/home/dethfo/e_port_folio/SDL/include/SDL3/SDL_error.h"
    "/home/dethfo/e_port_folio/SDL/include/SDL3/SDL_events.h"
    "/home/dethfo/e_port_folio/SDL/include/SDL3/SDL_filesystem.h"
    "/home/dethfo/e_port_folio/SDL/include/SDL3/SDL_gamepad.h"
    "/home/dethfo/e_port_folio/SDL/include/SDL3/SDL_gpu.h"
    "/home/dethfo/e_port_folio/SDL/include/SDL3/SDL_guid.h"
    "/home/dethfo/e_port_folio/SDL/include/SDL3/SDL_haptic.h"
    "/home/dethfo/e_port_folio/SDL/include/SDL3/SDL_hidapi.h"
    "/home/dethfo/e_port_folio/SDL/include/SDL3/SDL_hints.h"
    "/home/dethfo/e_port_folio/SDL/include/SDL3/SDL_init.h"
    "/home/dethfo/e_port_folio/SDL/include/SDL3/SDL_intrin.h"
    "/home/dethfo/e_port_folio/SDL/include/SDL3/SDL_iostream.h"
    "/home/dethfo/e_port_folio/SDL/include/SDL3/SDL_joystick.h"
    "/home/dethfo/e_port_folio/SDL/include/SDL3/SDL_keyboard.h"
    "/home/dethfo/e_port_folio/SDL/include/SDL3/SDL_keycode.h"
    "/home/dethfo/e_port_folio/SDL/include/SDL3/SDL_loadso.h"
    "/home/dethfo/e_port_folio/SDL/include/SDL3/SDL_locale.h"
    "/home/dethfo/e_port_folio/SDL/include/SDL3/SDL_log.h"
    "/home/dethfo/e_port_folio/SDL/include/SDL3/SDL_main.h"
    "/home/dethfo/e_port_folio/SDL/include/SDL3/SDL_main_impl.h"
    "/home/dethfo/e_port_folio/SDL/include/SDL3/SDL_messagebox.h"
    "/home/dethfo/e_port_folio/SDL/include/SDL3/SDL_metal.h"
    "/home/dethfo/e_port_folio/SDL/include/SDL3/SDL_misc.h"
    "/home/dethfo/e_port_folio/SDL/include/SDL3/SDL_mouse.h"
    "/home/dethfo/e_port_folio/SDL/include/SDL3/SDL_mutex.h"
    "/home/dethfo/e_port_folio/SDL/include/SDL3/SDL_oldnames.h"
    "/home/dethfo/e_port_folio/SDL/include/SDL3/SDL_opengl.h"
    "/home/dethfo/e_port_folio/SDL/include/SDL3/SDL_opengl_glext.h"
    "/home/dethfo/e_port_folio/SDL/include/SDL3/SDL_opengles.h"
    "/home/dethfo/e_port_folio/SDL/include/SDL3/SDL_opengles2.h"
    "/home/dethfo/e_port_folio/SDL/include/SDL3/SDL_opengles2_gl2.h"
    "/home/dethfo/e_port_folio/SDL/include/SDL3/SDL_opengles2_gl2ext.h"
    "/home/dethfo/e_port_folio/SDL/include/SDL3/SDL_opengles2_gl2platform.h"
    "/home/dethfo/e_port_folio/SDL/include/SDL3/SDL_opengles2_khrplatform.h"
    "/home/dethfo/e_port_folio/SDL/include/SDL3/SDL_pen.h"
    "/home/dethfo/e_port_folio/SDL/include/SDL3/SDL_pixels.h"
    "/home/dethfo/e_port_folio/SDL/include/SDL3/SDL_platform.h"
    "/home/dethfo/e_port_folio/SDL/include/SDL3/SDL_platform_defines.h"
    "/home/dethfo/e_port_folio/SDL/include/SDL3/SDL_power.h"
    "/home/dethfo/e_port_folio/SDL/include/SDL3/SDL_process.h"
    "/home/dethfo/e_port_folio/SDL/include/SDL3/SDL_properties.h"
    "/home/dethfo/e_port_folio/SDL/include/SDL3/SDL_rect.h"
    "/home/dethfo/e_port_folio/SDL/include/SDL3/SDL_render.h"
    "/home/dethfo/e_port_folio/SDL/include/SDL3/SDL_scancode.h"
    "/home/dethfo/e_port_folio/SDL/include/SDL3/SDL_sensor.h"
    "/home/dethfo/e_port_folio/SDL/include/SDL3/SDL_stdinc.h"
    "/home/dethfo/e_port_folio/SDL/include/SDL3/SDL_storage.h"
    "/home/dethfo/e_port_folio/SDL/include/SDL3/SDL_surface.h"
    "/home/dethfo/e_port_folio/SDL/include/SDL3/SDL_system.h"
    "/home/dethfo/e_port_folio/SDL/include/SDL3/SDL_thread.h"
    "/home/dethfo/e_port_folio/SDL/include/SDL3/SDL_time.h"
    "/home/dethfo/e_port_folio/SDL/include/SDL3/SDL_timer.h"
    "/home/dethfo/e_port_folio/SDL/include/SDL3/SDL_touch.h"
    "/home/dethfo/e_port_folio/SDL/include/SDL3/SDL_tray.h"
    "/home/dethfo/e_port_folio/SDL/include/SDL3/SDL_version.h"
    "/home/dethfo/e_port_folio/SDL/include/SDL3/SDL_video.h"
    "/home/dethfo/e_port_folio/SDL/include/SDL3/SDL_vulkan.h"
    "/home/dethfo/e_port_folio/SDL/build/include-revision/SDL3/SDL_revision.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/SDL3" TYPE FILE FILES
    "/home/dethfo/e_port_folio/SDL/include/SDL3/SDL_test.h"
    "/home/dethfo/e_port_folio/SDL/include/SDL3/SDL_test_assert.h"
    "/home/dethfo/e_port_folio/SDL/include/SDL3/SDL_test_common.h"
    "/home/dethfo/e_port_folio/SDL/include/SDL3/SDL_test_compare.h"
    "/home/dethfo/e_port_folio/SDL/include/SDL3/SDL_test_crc32.h"
    "/home/dethfo/e_port_folio/SDL/include/SDL3/SDL_test_font.h"
    "/home/dethfo/e_port_folio/SDL/include/SDL3/SDL_test_fuzzer.h"
    "/home/dethfo/e_port_folio/SDL/include/SDL3/SDL_test_harness.h"
    "/home/dethfo/e_port_folio/SDL/include/SDL3/SDL_test_log.h"
    "/home/dethfo/e_port_folio/SDL/include/SDL3/SDL_test_md5.h"
    "/home/dethfo/e_port_folio/SDL/include/SDL3/SDL_test_memory.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/licenses/SDL3" TYPE FILE FILES "/home/dethfo/e_port_folio/SDL/LICENSE.txt")
endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/home/dethfo/e_port_folio/SDL/build/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
