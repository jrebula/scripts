

mkdir ~/prog
cd ~/prog

wstool init .
wstool merge ~/scripts/arm2DWstoolDefinitions.rosinstall
wstool update

echo 'source ~/prog/config/SL-CONFIG.sh' >> ~/.bashrc

cd utlities
make
make install
cd ..

cd lwpr
make
make install
cd ..

cd SL
make
make install
cd ..

cd arm2D
make
make install
cd ..

cd arm2DUser
make
make install
#cd ..

xarm2D
