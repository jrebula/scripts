#!/bin/bash

#SOURCE_DIRECTORY=~/tmp/stuff
#DESTINATION_DIRECTORY=~/tmp/stuffCleaned

SOURCE_DIRECTORY=/media/New\ Volume/myProjects/IMUGaitAnalysis/rawData/LateralWalkingStabilityMechanisms/
DESTINATION_DIRECTORY=/media/New\ Volume/myProjects/IMUGaitAnalysis/rawData/LateralWalkingStabilityMechanismsCleaned

#cd $SOURCE_DIRECTORY
#ls -r $SOURCE_DIRECTORY
#find $SOURCE_DIRECTORY -type f | grep -v .rpd

echo $SOURCE_DIRECTORY
echo $DESTINATION_DIRECTORY

cp -r "$SOURCE_DIRECTORY/"** "$DESTINATION_DIRECTORY"
cd "$DESTINATION_DIRECTORY"

#find . -name "*.rpd" -print0 | xargs -0n 1
find . -name "*.rpd" -print0 | xargs -0 rm
