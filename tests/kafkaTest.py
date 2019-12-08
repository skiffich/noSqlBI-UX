from kafka import KafkaProducer
producer = KafkaProducer(bootstrap_servers='localhost:9092')
for _ in range(100):
	producer.send('topic5', b'some_message_bytes').get(timeout=1000)