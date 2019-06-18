# elasticsearch-vn-tokenizer
Dockerfile and plugin vn tokenizer

Build with docker image :
	 
	 docker pull toanmai/elasticsearch:6.8.0

Build from :
	- docker-image : docker.elastic.co/elasticsearch/elasticsearch:6.8.0
	- elasticsearch-plugin : elasticsearch-analysis-vietnamese:6.5.3
							 analysis-icu:6.8.0
Docker run :
	docker run -p 9200:9200 -p 9300:9300 -e "discovery.type=single-node" toanmai/elasticsearch:6.8.0
