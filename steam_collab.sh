wget https://cdn.akamai.steamstatic.com/client/installer/steam.deb
sudo dpkg -i steam.deb
sudo apt --fix-broken install
sudo dpkg --add-architecture i386 
sudo apt-get install libc6:i386 
sudo apt-get install libgl1-mesa-glx-lts-trusty:i386
sudo apt update
steam
