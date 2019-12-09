echo off

sudo apt-get update
sudo apt-get upgrade
sudo apt update
sudo apt update

sudo apt-get install vim -y
sudo apt-get install curl -y
curl --version
sudo apt-get install unzip -y

sudo apt install openjdk-8-jdk -y
sudo apt install openjdk-8-jre -y
java -version
curl https://1drv.ms/u/s!ApAsseJ88mCxk9ARyQ1nThCisoq0fQ?e=KqPenJ
sudo mkdir /usr/lib/jvm/
sudo tar -zxvf jdk-8u231-linux-x64.tar.gz -C /usr/lib/jvm/
sudo update-alternatives --install /usr/bin/java java /usr/lib/jvm/jdk1.8.0_231/bin/java 3
sudo update-alternatives --config java
export PATH=$PATH:/usr/lib/jvm/jdk1.8.0_231/bin
export JAVA_HOME=/usr/lib/jvm/jdk1.8.0_231/
export JRE_HOME=/usr/lib/jvm/jdk1.8.0_231/jre/
export J2SDKDIR=/usr/lib/jvm/jdk1.8.0_231/
export J2REDIR=/usr/lib/jvm/jdk1.8.0_231/jre/
java --version

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