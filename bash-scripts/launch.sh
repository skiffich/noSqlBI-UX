echo off

sudo apt-get update
sudo apt-get upgrade
sudo apt update
sudo apt update

echo installing vim
sudo apt install vim -y

sudo apt-get install unzip -y

sudo apt-get install openjdk-8-jdk -y
sudo apt-get install openjdk-8-jre -y
echo "JAVA_HOME=$(which java)" | sudo tee -a /etc/environment
source /etc/environment
echo $JAVA_HOME

echo installing git
sudo apt-get install git -y
git --version
git config --global user.name "dm"
git config --global user.email "skiff120@gmail.com"
git config --global credential.helper cache

echo initialize git
git init
git remote add origin https://github.com/skiffich/noSqlBI-UX.git
git pull origin master

cd bash-scripts

chmod +x "$PWD/launch.sh"
chmod +x "$PWD/python-install.sh"
chmod +x "$PWD/clear.sh"
chmod +x "$PWD/kafka-server-start.sh"
chmod +x "$PWD/kafka-create-topics.sh"
chmod +x "$PWD/zookeeper-server-start.sh"
chmod +x "$PWD/servers-stop.sh"
chmod +x "$PWD/cons1.sh"
chmod +x "$PWD/cons2.sh"

bash ./python-install.sh