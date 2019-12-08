echo off

export PATH="$PATH:#PWD"
chmod +x "$PWD/python-install.sh"

sudo apt-get update
sudo apt-get upgrade
sudo apt update
sudo apt update

sudo apt install vim -y
sudo apt install git -y
git --version
git config --global user.name "dm"
git config --global user.email "skiff120@gmail.com"

git init
git remote add origin https://github.com/skiffich/noSqlBI-UX.git
git pull origin master

python-install.sh