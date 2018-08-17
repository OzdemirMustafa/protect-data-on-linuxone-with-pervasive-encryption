# Welcome in step 3 about pushing crypto activity data to the ICP ELK microservice.
    
## Agenda of this section is about:
    1. Cloning the protect data on linuxone with pervasive encryption github repository
    2. Tooling for ELK crypto stack
    3. Feeding your ELK crypto dashboard

# 1. Cloning the protect data on linuxone with pervasive encryption github repository

First of all, let's install the lab required components and their dependencies in your LinuxONE Linux guest. Please issue the following command:
```
yum install docker-ce docker-compose git curl
```

Once done, it now time to clone the github repository of this code pattern. Please issue the following command:
```
git clone https://github.com/IBM/protect-data-on-linuxone-with-pervasive-encryption.git
```

Please move to the the cloned git repository. Please issue the following command:
```
cd protect-data-on-linuxone-with-pervasive-encryption/
```

Now, let's explore the content of the git repo. Please issue the following command:
```
ls -l

    total 96
    -rw-r--r-- 1 root root   581 Aug 17 16:43 CONTRIBUTING.md
    -rw-r--r-- 1 root root 11357 Aug 17 16:43 LICENSE
    -rw-r--r-- 1 root root  3200 Aug 17 16:43 MAINTAINERS.md
    -rw-r--r-- 1 root root  3836 Aug 17 16:43 README.md
    drwxr-xr-x 3 root root  4096 Aug 17 16:43 icastats
    drwxr-xr-x 2 root root  4096 Aug 17 16:43 images
    -rw-r--r-- 1 root root 25469 Aug 17 16:43 part1.md
    -rw-r--r-- 1 root root  3957 Aug 17 16:43 part2.md
    -rw-r--r-- 1 root root  6677 Aug 17 16:43 part3.md
    -rw-r--r-- 1 root root 19906 Aug 17 16:43 part4.md
    -rw-r--r-- 1 root root  2800 Aug 17 16:43 vmstat-script.sh
```

**Important content regarding the code pattern:**
* vmstat-script     : Main script to start to collect local vmstats and to push to Elasticsearh.
* icastats/         : Directory containing main scripts to start to collect local icastats and to push to Elasticsearh.

**Github administrative content includes the following:**
* images/     : Administrative folder to store illustrations.
* MAINTAINERS.md    : Information about maintainers.
* CONTRIBUTING.md   : Information about how to contribute.
* README.md   : Administrative git landing page.
* part1.md    : Administrative git landing page of part1.
* part2.md    : Administrative git landing page of part2.
* part3.md    : Administrative git landing page of part3.
* part4.md    : Administrative git landing page of part3.

# 2. Tooling for Elasticsearch
To see with a user friendly interface the status of your elasticsearch instance, please, install in your computer the elasticsearch web-plugin named elasticsearch-head. 

Fill in the form and connect to your elasticsearch instance with the appropriate IP adress. The portname is by default 9200.
Eg. http://<@ICP>:9200. 
  
You should be able to see something simillar to the following:

![alt text](https://github.com/IBM/protect-data-on-linuxone-with-pervasive-encryption/blob/master/images/elasticsearch-tool.png)

# 3. Feeding your ELK crypto dashboard

## Linux vmstat data collection

Now, let's configure the first data source made of Linux vmstats. To collect and to push these data to elasticsearch db we will use a script. Let's start to modify this script to adhere with your environment. Please, correct the default ESserverIP adress with your @IP adress according to your environment. Change the 2 line as show below:
```
vi vmstat-script.sh
  #!/bin/bash
  ESserverIP="10.3.57.112" <--- Change with the Elasticsearch ICP IP address here
```

Now, let's make this script executable thanks to following command:
```
chmod +x vmstat-script.sh
```

Let's start now the VMSTAT data collection. Please use the following command:
```
./vmstat-script.sh&

  {"_index":"monitor-vmstat","_type":"vmstat","_id":"Q3nqQmUBe_nBz08Ey66A","_version":1,"result":"created","_shards":{"total":2,"successful":1,"failed":0},"_seq_no":0,"_primary_term":1}sendToES 1534426007 3 0 53852 585408 392324 1186400 0 0 0 0 273 293 31 65 0 0 4

  {"_index":"monitor-vmstat","_type":"vmstat","_id":"Q3nqQmUBe_nBz08Ey66A","_version":1,"result":"created","_shards":{"total":2,"successful":1,"failed":0},"_seq_no":0,"_primary_term":1}sendToES 1534527018 3 0 53852 585408 392324 1186400 0 0 0 0 273 293 31 65 0 0 4
```
It is normal to see every 5 seconds a new line being displayed.

You can verify that there are new documents pushed to elasticsearch db thanks to your web browser tool. If you check it, and if you set the refresh to "Refresh every 5s" in the top-right corner, you should be able to see something as the following:

![alt-text](https://github.com/IBM/protect-data-on-linuxone-with-pervasive-encryption/blob/master/images/elasticsearch-tool-vmstat.png)


Please, now open a new ssh session to your LinuxONE Linux guest.

## Linux crypto icastats data collection

Now, let's configure the main data source made of Linux crypto ICASTATS. To collect and to push these data to elasticsearch db we will use a script. Let's start to modify this script to adhere with your environment. Please, correct the default ESserverIP adress with your @IP adress according to your environment. Change the 2 line as show below:
```
vi icastats/crypto-monitoring.sh
  #!/bin/bash
  ESserverIP="10.3.57.112" <--- Change with the Elasticsearch ICP IP address here
```

Now, let's make this script executable thanks to following command:
```
chmod +x icastats/crypto-monitoring.sh
```

Let's start now the VMSTAT data collection. Please use the following command:
```
./icastats/crypto-monitoring.sh&

  {"_index":"monitor-icastats","_type":"icastats","_id":"Rnn7QmUBe_nBz08EzK4S","_version":1,"result":"created","_shards":{"total":2,"successful":1,"failed":0},"_seq_no":0,"_primary_term":1}sendToES 1534427122 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 169
  {"_index":"monitor-icastats","_type":"icastats","_id":"R3n7QmUBe_nBz08E367i","_version":1,"result":"created","_shards":{"total":2,"successful":1,"failed":0},"_seq_no":0,"_primary_term":1}sendToES 1534427127 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
  ...
```

It is normal to see every 5 seconds a new line being displayed. Ervery 5 seconds, a record will be sent to the elasticsearch db. 

To assess that it works properly, with web interface there are new records added in the elasticsearch db.
Your elasticsearh web interface should look like the foolowing:

![alt text](https://github.com/IBM/protect-data-on-linuxone-with-pervasive-encryption/blob/master/images/elasticsearch-tool-vmstat-icastats.png)

👍 Congratulations! You are now good for the [step 4](https://github.com/IBM/protect-data-on-linuxone-with-pervasive-encryption/edit/master/part4.md) about creating a dashboard to magnify live captured crypto information.
