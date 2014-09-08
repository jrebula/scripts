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

p = "."

directories = map(x -> readdir(x), filter(x -> isdir(x), files))

show(directories)

typeof(directories)

* "/" *

searchDir(path, key) =
  begin
    println("searching dir " * path * " for the key " * key)
    if !isdir(path)
      println("turns out this is not a dir: " * path)
      return []
    end
    files = readdir(path)
    subDirs = filter(x -> isdir(path * "/" * x), files)
    #show(subDirs)
    ret = path * "/" * filter(x->contains(x,key), files)
    #return []
    for subDir in subDirs
      subDirName = path * "/" * subDir
      println("this dir is " * subDirName)
      ret = [ret, searchDir(subDirName, key)]
    end
    ret
 end

results = searchDir("./HERMES", "del")
show(results)


contains("asdf", "a")


