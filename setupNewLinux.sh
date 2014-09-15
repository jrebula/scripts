


sudo apt-add-repository ppa:cassou/emacs & sudo apt-get update & sudo apt-get install emacs24

sudo apt-get install meld


# speed up c compilations using ccache. Use something like the following:
sudo apt-get install ccache
echo "if [ \"\$HOSTNAME\" == \"$HOSTNAME\" -o \"\$HOSTNAME\" == \"someOtherMachineForWhichToSetUpLocalCaching\"]" >> ~/.bashrc
echo "then " >> ~/.bashrc
echo "  export CCACHE_DIR=/home/\$USER/.ccache" >> ~/.bashrc
echo "fi" >> ~/.bashrc
echo "if [ -d /usr/lib/ccache ]" >> ~/.bashrc
echo "then" >> ~/.bashrc
echo "  export PATH=/usr/lib/ccache:\$PATH" >> ~/.bashrc
echo "  export CCACHE_SLOPPINESS=file_macro,time_macros" >> ~/.bashrc
echo "fi" >> ~/.bashrc
echo "" >> ~/.bashrc



# install youtube downloader... or look up latest version on github
#sudo curl https://yt-dl.org/downloads/2014.08.10/youtube-dl -o /usr/local/bin/youtube-dl
#sudo chmod a+x /usr/local/bin/youtube-dl
#youtube-dl -U


# to change the number of workspaces
# go to here, follow instructions for CompizConfig settings Manager
# http://ubuntuhandbook.org/index.php/2013/07/change-number-of-workspaces-ubuntu/


# mount an iso
#sudo mkdir /mnt/matlabDisk
#sudo mount -o loop /media/New\ Volume/myPrograms/R2012b_UNIX.iso /mnt/matlabDisk





