from kafka import KafkaProducer
producer = KafkaProducer(bootstrap_servers='localhost:1234')
for _ in range(100):
	producer.send('topic5', b'some_message_bytes').get(timeout=1000)