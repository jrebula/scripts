# to setup SL
username="jrebula"
sudo apt-get install git
mkdir ~/prog
cd ~/prog

git clone $username@duerer.usc.edu:~clmc/Git/Projects/SL.git
git clone $username@duerer.usc.edu:~clmc/Git/Projects/utilities.git
git clone $username@duerer.usc.edu:~clmc/Git/Projects/lwpr.git
git clone $username@duerer.usc.edu:~clmc/Git/Projects/config.git
git clone $username@duerer.usc.edu:~clmc/Git/Projects/arm2D.git
git clone $username@duerer.usc.edu:~clmc/Git/Projects/arm2DUser.git
#git clone $username@duerer.usc.edu:~clmc/Git/Projects/biped.git
#git clone $username@duerer.usc.edu:~clmc/Git/Projects/bipedUser.git

cd config
./SL-INSTALL

echo "source ~/prog/config/SL-CONFIG.sh" >> ~/.bashrc
echo "source ~/prog/config/SL-CONFIG" >> ~/.cshrc

# not sure if we need this?
source ~/.bashrc

cd ../utilities
../config/SL-INSTALL

cd ../lwpr
../config/SL-INSTALL

cd ../arm2D
../config/SL-INSTALL

cd ../arm2DUser
../config/SL-INSTALL

#cd ../biped
#../config/SL-INSTALL

#cd ../bipedUser
#../config/SL-INSTALL

cd ../SL
../config/SL-INSTALL











