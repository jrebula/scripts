

sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu precise main" > /etc/apt/sources.list.d/ros-latest.list'
wget http://packages.ros.org/ros.key -O - | sudo apt-key add -
sudo apt-get update

sudo apt-get install python-wstool ros-groovy-catkin libboost-all-dev libeigen3-dev libpng zlib
sudo apt-get install ros-groovy-desktop-full ros-groovy-catkin python-rosdep
sudo apt-get install python-vcstools python-vcstool python-wstool python-netifaces
sudo apt-get install ros-groovy-arm-navigation ros-groovy-joy
sudo apt-get install python-rosinstall python-rospkg libedit-dev
sudo apt-get install ros-groovy-camera-drivers ros-groovy-openni-*
sudo apt-get install ros-groovy-audio-common
sudo apt-get install libconfig++8-dev libglew1.6-dev scons

installDirectory="/home/tempLocal/HERMESLocal"

cd $installDirectory

mkdir -p $installDirectory/src
cd $installDirectory/src
wstool init .
wstool merge http://www-amd.is.tuebingen.mpg.de/~herzog/hermes_core.rosinstall
wstool merge http://www-amd.is.tuebingen.mpg.de/~herzog/hermes_full.rosinstall
wstool merge http://www-amd.is.tuebingen.mpg.de/~herzog/hermes_lower.rosinstall

# on xenomai:
#wstool merge http://www-amd.is.tuebingen.mpg.de/~herzog/hermes_xeno.rosinstall

wstool update

cd ..
./src/catkin/bin/catkin_make

echo "source /opt/ros/groovy/setup.-" >> ~/.bashrc
echo "source ~/HERMES/devel/setup.bash" >> ~/.bashrc
source ~/.bashrc

# setup an eclipse project:
#cd $installDirectory
#catkin_make --force-cmake -G"Eclipse CDT4 - Unix Makefile"

# that didn't work... it is supposed to, and it sets up an "our of source build", which means it makes an eclipse project in installDir/build/, and sets up symbolic links to the source folders in installDir/src. Instead, we are going to set up an "in source" build, where we individually create eclipse projects in installDir/src/projFoo directories:

cd src/bipedLocomotionLib
cmake -G"Eclipse CDT4 - Unix Makefiles"

cd ../floatingBaseTools
cmake -G"Eclipse CDT4 - Unix Makefiles"

cd ../hermesCore
cmake -G"Eclipse CDT4 - Unix Makefiles"

cd ../hermesFull
cmake -G"Eclipse CDT4 - Unix Makefiles"

cd ../hermesFullUser
cmake -G"Eclipse CDT4 - Unix Makefiles"

cd ../hermesLower
cmake -G"Eclipse CDT4 - Unix Makefiles"

cd ../hermesLowerUser
cmake -G"Eclipse CDT4 - Unix Makefiles"

cd ../lwpr
cmake -G"Eclipse CDT4 - Unix Makefiles"

cd ../SL
cmake -G"Eclipse CDT4 - Unix Makefiles"

cd ../sl_config
cmake -G"Eclipse CDT4 - Unix Makefiles"

cd ../utilities
cmake -G"Eclipse CDT4 - Unix Makefiles"



# run demo simulation:
cd HERMES/src/hermesLowerUser
xhermes


#Once 'HERMES/devel/setup.bash' is sourced, we can rebuild the system by invoking: '
#catkin_make 
#inside 
#~/HERMES/

