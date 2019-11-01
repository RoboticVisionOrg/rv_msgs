uint16 ESTOP = 1
uint16 COLLISION = 2
uint16 JOINT_LIMIT_VIOLATION = 4
uint16 TORQUE_LIMIT_VIOLATION = 8
uint16 CARTESIAN_LIMIT_VIOLATION = 16
uint16 OTHER = 32768

geometry_msgs/PoseStamped ee_pose

int32[6] cartesian_collision
int32[6] cartesian_contact

uint16 errors
