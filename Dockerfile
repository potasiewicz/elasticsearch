# Elasticsearch
# docker pull barnybug/elasticsearch
FROM java:openjdk-7-jre
MAINTAINER Barnaby Gray <barnaby@pickle.me.uk>

ENV ES_VERSION 1.3.2

# download and unpack elasticsearch
RUN wget -q https://download.elastic.co/elasticsearch/elasticsearch/elasticsearch-$ES_VERSION.tar.gz -O - | tar zxvf - && \
mv /elasticsearch-$ES_VERSION /elasticsearch

RUN /elasticsearch/bin/plugin install elasticsearch/elasticsearch-mapper-attachments/2.3.2
RUN /elasticsearch/bin/plugin install org.wikimedia.search.highlighter/experimental-highlighter-elasticsearch-plugin/0.0.11

ADD elasticsearch.yml /elasticsearch/config/elasticsearch.yml

VOLUME ["/data", "/logs"]

EXPOSE 9200 9300
CMD ["/elasticsearch/bin/elasticsearch"]