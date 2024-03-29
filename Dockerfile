#Dockerfile
FROM docker.elastic.co/elasticsearch/elasticsearch:6.8.0

WORKDIR /usr/share/elasticsearch/bin
ENV discovery.type single-node
COPY elasticsearch-analysis-vietnamese-6.5.3.zip .
COPY analysis-icu-6.8.0.zip .
COPY sysctl.conf /etc/sysctl.conf

RUN /bin/sh elasticsearch-plugin install --batch file:///usr/share/elasticsearch/bin/elasticsearch-analysis-vietnamese-6.5.3.zip && \
  /bin/sh elasticsearch-plugin install --batch file:///usr/share/elasticsearch/bin/analysis-icu-6.8.0.zip
