FROM debian:jessie
MAINTAINER Nick Randell <nick.randell@sceneskope.com>

RUN apt-get update && apt-get install -y openjdk-7-jre-headless wget
RUN wget -q -O - http://apache.mirrors.pair.com/kafka/0.8.2.1/kafka_2.10-0.8.2.1.tgz | tar -xzf - -C /opt \
    && mkdir -p /tmp/kafka-logs

ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64
ENV KAFKA_HOME=/opt/kafka_2.10-0.8.2.1

EXPOSE 9092


VOLUME ["/tmp/kafka-logs"]

ADD start-kafka.sh ${KAFKA_HOME}/


WORKDIR ${KAFKA_HOME}
CMD ["./start-kafka.sh"]

