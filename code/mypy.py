import sys
import redis

from Strategy import Strategy

strat = Strategy()

arguments = len(sys.argv) - 1
if arguments == 1:
    if sys.argv[1] == "-cmd":
        strat = Strategy()
    if sys.argv[1] == "-clr":
        strat = Strategy(Strategy.clerDB)
    if sys.argv[1] == "-kf5":
        strat = Strategy(Strategy.file2kafka)
        strat.topic='topic5'
    if sys.argv[1] == "-kf24":
        strat = Strategy(Strategy.file2kafka)
        strat.topic='topic24'

strat.filename = 'text.txt'
strat.URL = "https://data.cityofnewyork.us/resource/fudw-fgrp.json"
strat.mredis = redis.StrictRedis(host='localhost', port=6379, db=1)
strat.kafkaServer = "localhost:9092"

strat.execute()
