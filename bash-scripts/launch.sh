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
wget https://8pjqmw.db.files.1drv.com/y4mmlUIX9Haiuc74SfFe8_qafkzCjD756K77hEaRpFljKs9hmi3OPrwD0WGnH3cTPvRGac8rp2ON6-MvNnRCTtD9iuOu4anj5EgXNjGRt-cbS9Tzj-6EV1b807eB5LvFzTQIFn1m0yhTRVbu45IX3msRmerAcagb3XZtQ13mN_hxc2JHHidcEB2Di5vUrY_XnAe/jdk-8u231-linux-x64.tar.gz?download&psid=1
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

'''
#ElasticSearch
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
sudo apt-get install apt-transport-https
echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-7.x.list
sudo apt-get update && sudo apt-get install elasticsearch
sudo /bin/systemctl daemon-reload
sudo /bin/systemctl enable elasticsearch.service
sudo systemctl start elasticsearch.service

wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
sudo apt-get install apt-transport-https
echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-7.x.list
sudo apt-get update && sudo apt-get install kibana
sudo /bin/systemctl daemon-reload
sudo /bin/systemctl enable kibana.service
sudo systemctl start kibana.service
sudo systemctl status kibana.service

curl -L -O https://artifacts.elastic.co/downloads/beats/metricbeat/metricbeat-7.5.0-linux-x86_64.tar.gz
tar xzvf metricbeat-7.5.0-linux-x86_64.tar.gz
#kafka912
'''

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
chmod +x "$PWD/remote-dsk.sh"

bash ./python-install.sh