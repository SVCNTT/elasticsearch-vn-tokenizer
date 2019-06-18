# elasticsearch-vn-tokenizer
Dockerfile and plugin vn tokenizer

Build with docker image :
	 
	 docker pull toanmai/elasticsearch:6.8.0

Build from :
	- docker-image : docker.elastic.co/elasticsearch/elasticsearch:6.8.0
	- elasticsearch-plugin : elasticsearch-analysis-vietnamese:6.5.3
							 analysis-icu:6.8.0
							 
Docker run :

	docker run -p 9200:9200 -p 9300:9300 toanmai/elasticsearch:6.8.0

Elasticsearch index :

	POST _/{{$index name}}
	{
	  "settings": {
	    "index": {
	        "number_of_shards" : 1,
	        "number_of_replicas" : 1,        
	    	"analysis": {
	        	"analyzer": {
	        		"ghn_clienthubs_analyzer": {
	            		"tokenizer": "vi_tokenizer",
	            		"char_filter":  [ "html_strip" ],
		            	"filter": [
		            		"icu_folding"
		            	]
	        		}
	        	}
	    	}
	    }
	  },
	    "mappings": {
	        "clienthubs_type": {
	            "properties" : {
	                "Address" : {
	                    "type" : "text",
	                    "analyzer" : "ghn_clienthubs_analyzer"
	                }
	            }            
	        }
	    }
	}
