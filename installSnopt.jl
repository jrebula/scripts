

## have to run this in terminal:
#run(`sudo apt-get install libf2c2-dev`)

## You need a catkin workspace setup (e.g. search mpi wiki: "install code for Hermes/Athena", or similar),
# set the name of the catkin workspace below:
catkinWorkspaceDir = homedir() * "/HERMES";
workspaceDirectory = homedir() * "/workspace"; # desired parent directory for snopt source


## generate names of installation directories
snoptInstallationDirectory = workspaceDirectory * "/snopt_cpp";
catkinSourceDir = catkinWorkspaceDir * "/src";
pyCPPInterfaceInstallationDirectory = catkinSourceDir * "/py_cpp_interface";
snoptPyInstallationDirectory = catkinSourceDir * "/slim_snopt_cpp_py_interface";


## grab sources:
cd(workspaceDirectory)
run(`git clone jrebula@duerer.usc.edu:~herzog/Git/Projects/snopt_cpp.git`)

cd(catkinSourceDir)
run(`git clone jrebula@duerer.usc.edu:~herzog/Git/Projects/py_cpp_interface.git`)
run(`git clone jrebula@duerer.usc.edu:~herzog/Git/Projects/slim_snopt_cpp_py_interface.git`)


## build projects:
cd(snoptInstallationDirectory)
run(`./build_this`)

cd(catkinWorkspaceDir)
run(`./src/catkin/bin/catkin_make --directory=HERMES`)

cd(snoptPyInstallationDirectory)
run(`ln -s $snoptInstallationDirectory snopt7`)


## run a little snopt test... well, for some reason you can't do this from Julia :/
# try in a prompt though!
cd(catkinWorkspaceDir * "/devel/lib/slim_snopt_cpp_py_interface")
run(`./test_python_slim_snopt`)





