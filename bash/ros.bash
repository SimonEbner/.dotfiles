if [ -f /opt/ros/electric/setup.bash ]; then
    source /opt/ros/electric/setup.bash
fi
export ROS_PACKAGE_PATH=~/ba:~/git/care-o-bot:$ROS_PACKAGE_PATH
export ROBOT=cob3-6
export ROBOT_ENV=ipa-kitchen
