cmake_minimum_required(VERSION 2.8.3)
project(rv_msgs)

# Compile as C++11, supported in ROS Kinetic and newer
# add_compile_options(-std=c++11)

find_package(catkin REQUIRED COMPONENTS
  # mvp_grasping
  #actionlib_msgs
  message_generation
  sensor_msgs
  shape_msgs
  std_msgs
  )

# GLOB method (pro: don't have to write out & maintain lists, con: CMake gets
# confused so you have to compile the workspace from scratch when adding new
# files)
# file(
#   GLOB rv_msgs_MESSAGES
#   RELATIVE "${CMAKE_CURRENT_SOURCE_DIR}/msg"
#   "./msg/*.msg"
#   )
# file(
#   GLOB rv_msgs_SERVICES
#   RELATIVE "${CMAKE_CURRENT_SOURCE_DIR}/srv"
#   "./srv/*.srv"
#   )
# file(
#   GLOB rv_msgs_ACTIONS
#   RELATIVE "${CMAKE_CURRENT_SOURCE_DIR}/action"
#   "./action/*.action"
#   )

# add_message_files(FILES ${rv_msgs_MESSAGES})

# add_service_files(DIRECTORY srv FILES ${rv_msgs_SERVICES})

# add_action_files(DIRECTORY action FILES ${rv_msgs_ACTIONS})

# Proper way (use ':r !ls <dir_name>' to populate easily...)
add_message_files(FILES
  ROS1Message.msg
  )

add_service_files(DIRECTORY srv FILES
  GetDoorStatus.srv
  )

#add_action_files(DIRECTORY action FILES
#  )

# Generate added messages and services with any dependencies listed here
generate_messages(
  DEPENDENCIES
  # mvp_grasping
  # actionlib_msgs
  sensor_msgs
  std_msgs
  )

catkin_package(
  #  INCLUDE_DIRS include
  #  LIBRARIES rv_msgs
  #CATKIN_DEPENDS actionlib_msgs
  #  DEPENDS system_lib
  )
