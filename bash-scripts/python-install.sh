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