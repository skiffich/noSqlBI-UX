import requests
import json
import redis
import types
from kafka import KafkaProducer

class Strategy:
    def __init__(self, func = None):
        self.filename = 'text.txt'
        self.URL = "https://data.cityofnewyork.us/resource/fudw-fgrp.json"
        self.mredis = redis.StrictRedis(host='localhost', port=6379, db=1)
        self.kafkaServer = "localhost:9092"
        self.topic = "topic5"
        s = str(self.mredis.get(self.filename))
        self.indexFrom = 0
        if s.startswith("b'read from "):
            self.indexFrom = s.split(" ")
            self.indexFrom = int(self.indexFrom[len(self.indexFrom) - 1].split("'")[0])
        self.indexFrom = self.indexFrom + 1
        if func is not None:
            self.execute = types.MethodType(func, self)
            print(self.mredis.get(self.filename))
            self.mredis.bgsave()

    def execute(self):
        self.rest2file()
        self.file2console()
        print(self.mredis.get(self.filename))
        self.mredis.bgsave()

    def clerDB(self):
        self.mredis.flushdb()
        print("DB cleared")

    def rest2file(self):
        filestatus = self.mredis.get('fileStatus')
        if filestatus == b'Completed':
            self.mredis.set(self.filename, "Trying to write file again")
            return
        self.mredis.set('fileStatus', 'Start writing to %s' % self.filename)
        print("reading from REST API.......")
        response = requests.get(self.URL)
        pfile = open(self.filename, 'w')
        pfile.write(response.text)
        pfile.close()
        self.mredis.set('fileStatus', 'Completed')

    def file2console(self):
        pfile = open(self.filename, 'r')
        readed = pfile.read()
        pfile.close()
        events = json.loads(readed)
        if len(list(events)) >= self.indexFrom + 99:
            self.mredis.set(self.filename, 'read from %s from %i to %i' % (self.filename, self.indexFrom, self.indexFrom + 99))
            for eventId in range (self.indexFrom, self.indexFrom + 1):
                print (events[eventId])
        else:
            print("End of File")
            self.clerDB()
    
    def file2kafka(self):
        pfile = open(self.filename, 'r')
        readed = pfile.read()
        pfile.close()
        producer = KafkaProducer(bootstrap_servers=self.kafkaServer, value_serializer=lambda v: json.dumps(v).encode('utf-8'))
        events = json.loads(readed)
        if len(list(events)) >= self.indexFrom + 99:
            self.mredis.set(self.filename, 'read from %s from %i to %i' % (self.filename, self.indexFrom, self.indexFrom + 99))
            for eventId in range (self.indexFrom, self.indexFrom + 99):
                producer.send(self.topic, events[eventId]).get(timeout=1000)
        else:
            print("End of File")
            self.clerDB()
