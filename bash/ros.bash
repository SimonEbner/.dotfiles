if [ -f /opt/ros/groovy/setup.bash ]; then
    source /opt/ros/groovy/setup.bash
fi

export ROS_PACKAGE_PATH=~/ros:$ROS_PACKAGE_PATH
export ROBOT=cob3-6
export ROBOT_ENV=ipa-kitchen

function testrxconsole(){
    uri=$ROS_MASTER_URI
    export ROS_MASTER_URI=http://localhost:22422
    rxconsole
    export ROS_MASTER_URI=$uri
}

function testrviz(){
    uri=$ROS_MASTER_URI
    export ROS_MASTER_URI=http://localhost:22422
    rosrun rviz rviz
    export ROS_MASTER_URI=$uri
}
