# demo_ros_python_matlab
Communication between different programming languages through ROS

## Usage instructions
1. catkin_make
1. source devel/setup.zsh (or setup.bash)
1. Start a ROS master : roscore
1. Build custom service for MATLAB and start server : matlab_server.m
1. Run the python_client.py

## Relevant information
Start with a base catkin workspace (http://wiki.ros.org/ROS/Tutorials/InstallingandConfiguringROSEnvironment)
### Creating package (http://wiki.ros.org/ROS/Tutorials/CreatingPackage)
* cd src/
	```sh
	catkin_create_pkg demo_package std_msgs rospy
	```
* cd ../demo_ros_python_matlab & catkin_make

### Custom message or service description (http://wiki.ros.org/msg#Building_.msg_Files)
If existing standard formats (http://wiki.ros.org/common_msgs) are not applicable
* In src/demo_package, create msg/DemoMsg.msg and srv/DemoSrv.srv
* To build them with the ROS package (http://wiki.ros.org/catkin/CMakeLists.txt#msgs_srvs_actions), edit *CMakeLists.txt* and *package.xml* and then catkin_make

### Demo service and client
* Python client (http://wiki.ros.org/ROS/Tutorials/WritingServiceClient%28python%29)
* MATLAB server (https://www.mathworks.com/help/ros/ug/call-and-provide-ros-services.html)
* To add custom message / service support in MATLAB see (https://www.mathworks.com/help/ros/ref/rosgenmsg.html)
