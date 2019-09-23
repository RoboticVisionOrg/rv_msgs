# Object details
string class_label

# Object location
uint16 x_left
uint16 y_top
uint16 width
uint16 height

# Cropped images capturing the detection (not all are required)
# NOTE: if these have dimensions other than width x height, your message is wrong
sensor_msgs/Image cropped_rgb
sensor_msgs/Image cropped_depth
sensor_msgs/Image cropped_mask  # Treat this as a white box mask if empty
