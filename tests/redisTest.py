import redis
r = redis.StrictRedis(host='localhost', port=6379, db=1)
r.set('test1',5)
print(r.get('test1'))
r.flushdb()