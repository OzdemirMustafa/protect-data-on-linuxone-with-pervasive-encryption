# Welcome in Step 2 about instantiating the ELK microservice from the IBM Cloud private catalog

The objective is to discover the IBM Cloud private catalog in order to instantiate containers from Docker images that once together create the ELK microservice. In this way, you will be able to create later your crypto dashboard from ICp.

The objective is to deploy and ELK infrastructure able to create the following kind of dashboard:

![alt-text](https://github.com/guikarai/ELK-CPACF/blob/master/images/full-dashboard.png)

## The agenda for this section is about:
1. What the ELK..?!
2. What to Keep in mind about ELK?
3. Discover the Helm chart from the calalog
4. Configure and install your ELK microservice
5. Access your ELK microservice

# 1. What the ELK..?!
Elasticsearch is a search engine based on Lucene. It provides a distributed, multitenant-capable full-text search engine with an HTTP web interface and schema-free JSON documents. Elasticsearch is developed in Java and is released as open source under the terms of the Apache License. Official clients are available in Java, .NET (C#), PHP, Python, Apache Groovy, Ruby and many other languages. According to the DB-Engines ranking, Elasticsearch is the most popular enterprise search engine followed by Apache Solr, also based on Lucene.

Elasticsearch is developed alongside a data-collection and log-parsing engine called Logstash, and an analytics and visualisation platform called Kibana. The three products are designed for use as an integrated solution, referred to as the "Elastic Stack" (formerly the "ELK stack").

Elasticsearch can be used to search all kinds of documents. It provides scalable search, has near real-time search, and supports multitenancy. "Elasticsearch is distributed, which means that indices can be divided into shards and each shard can have zero or more replicas. Each node hosts one or more shards, and acts as a coordinator to delegate operations to the correct shard(s). Rebalancing and routing are done automatically". Related data is often stored in the same index, which consists of one or more primary shards, and zero or more replica shards. Once an index has been created, the number of primary shards cannot be changed.

More information about ELK here: https://www.elastic.co

# 2. What to Keep in mind about ELK?
"ELK" is the acronym for three open source projects: Elasticsearch, Logstash, and Kibana. 

* Elasticsearch is a search and analytics engine. 
* Logstash is a server‑side data processing pipeline that ingests data from multiple sources simultaneously, transforms it, and then sends it to a "stash" like Elasticsearch. 
* Kibana lets users visualize data with charts and graphs in Elasticsearch. 

The Elastic Stack is the next evolution of ELK.

# 3. Discover the Helm chart from the calalog

The App center provides a centralized location from which you can browse, and install packages in your cluster.
Packages for additional IBM products are available from curated repositories that are included in the default IBM Cloud Private repository list. Your environment must be connected to the internet for you to access the charts for these packages.

Helm, which is the Kubernetes native package management system, is used for application management inside an IBM Cloud Private cluster. The Helm GitHub community curates and continuously expands a set of tested and preconfigured Kubernetes applications. This catalog of stable applications can be added to your cluster from the management console. Installing this Helm community catalog, provides an extra 40+ Kubernetes applications that are ready for deployment in your cluster. 

Prior to follow steps described in this section, please request an IBM Cloud private access from the LinuxONE community Cloud. To do so, please go [here](https://developer.ibm.com/linuxone/home-l1cc30-test/), and click on "Try Containers".

Once you have your access, you can resume your code pattern journey with the following.

**Action:** Login to the [IBM Cloud private catalog] () and fill credentials:

![alt-text](https://github.com/IBM/protect-data-on-linuxone-with-pervasive-encryption/blob/master/images/icp-0.png)

**Action:** Click on the top-right bar on **catalog** from the menu. This will display the catalog of Helm Charts that is available on the ICP.

![alt-text](https://github.com/IBM/protect-data-on-linuxone-with-pervasive-encryption/blob/master/images/icp-1.png)

**Action:** From the selection, click on the Helm Chart called **ibm-elk-dev** to see the overview of the this ELK microservice.

![alt-text](https://github.com/IBM/protect-data-on-linuxone-with-pervasive-encryption/blob/master/images/icp-2.png))

**Action:** As you can see in this overview, you selected an ELK microservice to be deployed. You can easily intuit that this microservices is made of 3 docker containers (Elasticsearch, Logstash and Kibana). Click on **Configure** on the bottom-right corner.

# 4. Configure and install your ELK microservice

You can configure ELK resources and services here by setting the Memory limits and editing node ports. You are also invited to set the release name and target namespace at this section.

![alt-text](https://github.com/IBM/protect-data-on-linuxone-with-pervasive-encryption/blob/master/images/icp-3.png)

**Action:** Please fill-in the form with an appropriate and unique  **Release name** as shown below. Why not your FirstnameLastname? Select also the appropritate **Target namespace**.

![alt-text](https://github.com/IBM/protect-data-on-linuxone-with-pervasive-encryption/blob/master/images/icp-4.png)

**Action:** Scroll down a little-bit in order to get access to the Elasticsearch and Logstach configuration section. There is nothing to be done here. Default port for elasticsearch is 9200, and 5601 for Kibana. To confirm, and to go the next step, please click on **Install**

# 5. Access your ELK microservice

Please check that the following URL return something to you:
* Your-ICP-Service:9200  : Elasticsearch technical message indicating everything is alright
* Your-ICP-Service:5601  : Main Kibana landing page

👍 Congratulations! Your ELK application has been instantiated from IBM Cloud Private. You can now ready for the [Step 3](https://github.com/IBM/protect-data-on-linuxone-with-pervasive-encryption/blob/master/part3.md).
