/usr/local/kafka/bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic topic5
/usr/local/kafka/bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic topic24
/usr/local/kafka/bin/kafka-topics.sh --zookeeper localhost:2181 --alter --topic topic5 --config retention.ms=300000
/usr/local/kafka/bin/kafka-topics.sh --zookeeper localhost:2181 --alter --topic topic24 --config retention.ms=86400000