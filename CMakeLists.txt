cmake_minimum_required(VERSION 3.5)

project(rv_msgs)

# Default to C++14
if(NOT CMAKE_CXX_STANDARD)
  set(CMAKE_CXX_STANDARD 14)
endif()
if(CMAKE_COMPILER_IS_GNUCXX OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  add_compile_options(-Wall -Wextra -Wpedantic)
endif()

find_package(ament_cmake REQUIRED)
find_package(rosidl_default_generators REQUIRED)

find_package(geometry_msgs REQUIRED)
find_package(sensor_msgs REQUIRED)
find_package(std_msgs REQUIRED)


# GLOB method (pro: don't have to write out & maintain lists, con: CMake gets
# confused so you have to compile the workspace from scratch when adding new
# files)
file(
  GLOB rv_msgs_MESSAGES
  RELATIVE "${CMAKE_CURRENT_SOURCE_DIR}"
  "./msg/*.msg"
  )
file(
  GLOB rv_msgs_SERVICES
  RELATIVE "${CMAKE_CURRENT_SOURCE_DIR}"
  "./srv/*.srv"
  )
file(
  GLOB rv_msgs_ACTIONS
  RELATIVE "${CMAKE_CURRENT_SOURCE_DIR}"
  "./action/*.action"
  )

# Proper way (use ':r !ls <dir_name>' to populate easily...)

rosidl_generate_interfaces(${PROJECT_NAME}
  ${rv_msgs_MESSAGES}
  ${rv_msgs_SERVICES}
  ${rv_msgs_ACTIONS}
  DEPENDENCIES geometry_msgs sensor_msgs std_msgs
 )

install(FILES mapping_rule.yaml DESTINATION share/${PROJECT_NAME}
)

if(BUILD_TESTING)
  find_package(ament_lint_auto REQUIRED)
  # the following line skips the linter which checks for copyrights
  # uncomment the line when a copyright and license is not present in all source files
  #set(ament_cmake_copyright_FOUND TRUE)
  # the following line skips cpplint (only works in a git repo)
  # uncomment the line when this package is not in a git repo
  #set(ament_cmake_cpplint_FOUND TRUE)
  ament_lint_auto_find_test_dependencies()
endif()

ament_export_dependencies(rosidl_default_runtime)
ament_package()