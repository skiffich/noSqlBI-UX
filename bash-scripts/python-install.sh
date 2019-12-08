echo update & upgrade 
echo ...
echo off 
sudo apt-get update && sudo apt-get upgrade && sudo apt-get dist-upgrade && sudo apt-get autoremove
echo on

echo install the dependencies
echo ...
echo off
sudo apt-get install python3 python3-pip -y
sudo apt-get install python3-pip -y
sudo apt-get install python-pip -y
sudo apt-get install python3-numpy python3-matplotlib python3-scipy python3-pandas python3-simpy -y
sudo apt-get install ipython3 ipython3-notebook -y
sudo apt-get install python -y
sudo apt-get install python3 -y
echo on

echo pythonn installed
echo !!!!!!!!!!!!!!!!
echo please install pycharm from ubuntu sofware
echo !!!!!!!!!!!!!!!!

pip install requests
pip3 install requests

echo python2-test
python ../tests/pythonRequestsTest.py
echo python3-test
python3 ../tests/pythonRequestsTest.py

echo install redis
sudo apt-get install redis-server -y
sudo systemctl start redis
pip install redis
pip3 install redis

echo python2-test
python ../tests/redisTest.py
echo python3-test
python3 ../tests/redisTest.py

echo kafka install
sudo apt install default-jdk -y
pip install kafka-python
pip3 install kafka-python
cd ~/Downloads
# Uncomment for first launch
#wget http://www-us.apache.org/dist/kafka/2.2.1/kafka_2.12-2.2.1.tgz
#tar xzf kafka_2.12-2.2.1.tgz
#sudo mv kafka_2.12-2.2.1 /usr/local/kafka
bash zookeeper-server-start.sh