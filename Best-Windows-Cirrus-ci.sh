echo Updating, and installing things needed
apt update
apt install unzip -y
apt install wget -y
apt install curl -y
apt install sudo -y
wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip > /dev/null 2>&1
unzip ngrok-stable-linux-amd64.zip 
read -p "Paste authtoken here (Copy and Ctrl+V to paste then press Enter): " CRP
./ngrok authtoken $CRP 
nohup ./ngrok tcp 5900 
echo Please wait for installing...
echo "Installing QEMU (2-3m)..."
apt install qemu-system-x86 
echo Downloading Windows Disk...
curl -L -o lite10.qcow2 https://app.vagrantup.com/thuonghai2711/boxes/WindowsQCOW2/versions/1.0.9/providers/qemu.box
echo "Windows 10 x64 Lite On Google Colab"
echo Your VNC IP Address:
curl --silent --show-error http://127.0.0.1:4040/api/tunnels | sed -nE 's/.*public_url":"tcp:..([^"]*).*/\1/p'
echo "Note: Use Right-Click Or Ctrl+C To Copy"
echo "Please Keep Cirrus CI tab open, do not close"
echo Script by Thuonghai001 fb.com/thuong.hai.581 and KingOfNetflix#7044
qemu-system-x86_64 -hda lite10.qcow2 -m 8G -enable-kvm -cpu host -smp cores=4 -machine usb=on -device usb-tablet -vga std
