# test

# to get light table with julia, follow these instructions: https://github.com/one-more-minute/Juno-LT/wiki/Installing-%26-Upgrading
# First, we assume we have a working SL installation at this location

# Pkg.add("Winston")

homeDirectory = "/Network/Servers/duerer/Volumes/duerer/jrebula/"
SLInstallationFolder = homeDirectory * "prog/"

newProjectName = "arm2DInvertedPendulum"

newProjectLocation = SLInstallationFolder * newProjectName

function sho(a)
  print("createNewSimulationLaboratoryModel.jl: ")
  show(a)
end

if !isdir(newProjectLocation)
  mkdir(newProjectLocation)
end


# if you copy in Arm2D, e.g. delete the makefiles folder

newProjectSourceLocation = newProjectLocation * "/src/"
cmakeFileLocation = newProjectSourceLocation * "CMakeLists.txt"

#sho(cmakeFileLocation)


# in cmakeFileLocation, change this line to
#set(NAME "arm2DInvertedPendulum")


# in
slUserIncludeFile = newProjectLocation * "/include/SL_user.h"
# change this line to the new robot name
#define ROBOT_NAME "arm2DInvertedPendulum"

# after copying in all other files, have to do:

a = run(`make clean & make & make install`)

