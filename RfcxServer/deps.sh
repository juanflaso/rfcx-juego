#File used to install and configure the dependencies for rfcx-espol Web and Stream Servers

# dotnet core
# https://www.microsoft.com/net/learn/get-started/linuxubuntu
# This is the process for Ubuntu 16.04
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-ubuntu-xenial-prod xenial main" > /etc/apt/sources.list.d/dotnetdev.list'
apt-get install apt-transport-https
apt-get update
apt-get install dotnet-sdk-2.0.0

# ffmpeg
add-apt-repository ppa:mc3man/trusty-media  
apt-get update  
apt-get install ffmpeg  
apt-get install frei0r-plugins 

