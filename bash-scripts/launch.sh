echo off

sudo apt-get update
sudo apt-get upgrade
sudo apt update
sudo apt update

echo installing vim
sudo apt install vim -y

sudo apt-get install unzip -y

echo installing git
sudo apt-get install git -y
git --version
git config --global user.name "dm"
git config --global user.email "skiff120@gmail.com"

echo initialize git
git init
git remote add origin https://github.com/skiffich/noSqlBI-UX.git
git pull origin master

cd bash-scripts

chmod +x "$PWD/launch.sh"
chmod +x "$PWD/python-install.sh"

python-install.sh