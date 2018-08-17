# Welcome in the Step 4 about building a crypto dashboard with Kibana.

In this part, you will use the ELK microservices to create your first crypto dashboard with Kibana.

The agenda of this section is about:
1. Accessing to Kibana
2. Sourcing the ElasticSearch DataSource
3. Creating your first search with Kibana
4. Creating your first charts with Kibana
5. Creating your first dashboard with Kibana
6. Sharing your first crypto dashboard
7. Using your first dashboard

Kibana is a window into the Elastic Stack. It enables visual exploration and real-time analysis of your data in Elasticsearch. This video is perfect for users that are new to Kibana and are looking for a primer on data exploration, visualization, and dashboarding. Watch Alex Francoeur give a demo of going from a Kibana installation to a full dashboard in matter of minutes. 

# 1. Accessing to Kibana

Note that the IP adress of your LinuxONE cloud Linux VM is different, you must adapt the following accordingly. You can access to the Kibana landing page using the following URL: http://your_ip_adress:5601

A reachable kibana web interface should look like as follow:
![alt text](https://github.com/IBM/protect-data-on-linuxone-with-pervasive-encryption/blob/master/images/kibana-landingpage.png)

Now, let's see how Kibana can connect to a source of data (in our case the Elasticsearch DB).

# 2. Sourcing the ElasticSearch DataSource

It is time to create an Index Pattern to Connect to Elasticsearh. To use Kibana, you have to tell it about the Elasticsearch indices that you want to explore by configuring one or more index patterns. 

**Action:** Click on the left tab bar to **"Management"**.

![alt text](https://github.com/IBM/protect-data-on-linuxone-with-pervasive-encryption/blob/master/images/kibana-index-creation0.png)

**Action:** Then Click on **Index patterns**.

## Creating your first "Index"

An index pattern identifies one or more Elasticsearch indices that you want to explore with Kibana. Kibana looks for index names that match the specified pattern. An asterisk (*) in the pattern matches zero or more characters. For example, the pattern myindex-* matches all indices whose names start with myindex-, such as myindex-1 and myindex-2.

An index pattern can also simply be the name of a single index.

**Action:** Click on Index pattern area, and fill the tab with **monitor-vmstat*** as follow. 

![alt text](https://github.com/IBM/protect-data-on-linuxone-with-pervasive-encryption/blob/master/images/kibana-index-creation1.png)

**Action:** Then click to **Next Step**.
  
Your index contains a timestamp field that you want to use to perform time-based comparisons, select the Index contains time-based events option and select the index field that contains the timestamp. Kibana reads the index mapping to list all of the fields that contain a timestamp.

**Action:** In configure settings panel, please select **@Timestamp**.

![alt text](https://github.com/IBM/protect-data-on-linuxone-with-pervasive-encryption/blob/master/images/kibana-index-creation2.png)

**Action:**  Then validate by clicking on **Create index pattern**.

Here you are, you just sourced Kibana to your crypto monitoring Elasticsearch DB and its content. The structure of the index monitor-vmstat is displayed front of you.

![alt text](https://github.com/IBM/protect-data-on-linuxone-with-pervasive-encryption/blob/master/images/kibana-index-creation4.png)

## Creating a second index about Linux crypto data

You just create your first index about vmstat. Now, please create a new index about Linux encryption activity the with the following information:

* **Action:** Click on the left tab bar to **"Management"**.
* **Action:** Then Click on **Index patterns**.
* **Action:** Click on Index pattern area, and fill the tab with **monitor-icastats***.
* **Action:** Then click to **Next Step**.
* **Action:** In configure settings panel, please select **@Timestamp**.
* **Action:**  Then validate by clicking on **Create index pattern**.

Cool, you have now two created indexes. One named monitor-vmstat and one named monitor-icastats.

It is now time to discovert, search, and filter sent information to the Elasticsearch DB thanks to a "Search".

**Action:** Click on the left tab bar on **"Discover"**. 

# 3. Creating your first "Searchs"

## Creating a search about Linux VMSTAT data

You can interactively explore your data from the Discover page. You have access to every document in every index that matches the selected index pattern. You can submit search queries, filter the search results, and view document data. You can also see the number of documents that match the search query and get field value statistics. If a time field is configured for the selected index pattern, the distribution of documents over time is displayed in a histogram at the top of the page.

![alt text](https://github.com/IBM/protect-data-on-linuxone-with-pervasive-encryption/blob/master/images/kibana-search-creation0.png)

Let's start to discover and to explore VMSTAT data sent by LinuxONE virtual machine. When you submit a search request, the histogram, Documents table, and Fields list are updated to reflect the search results. The total number of hits (matching documents) is shown in the toolbar. The Documents table shows the first five hundred hits. 

By default, the hits are listed in reverse chronological order, with the newest documents shown first. You can reverse the sort order by clicking the Time column header. You can also sort the table by the values in any indexed field.

**Action:** On Available field MODE, on the line of "Host", Click on "add" field MODE. It result the following:

![alt text](https://github.com/guikarai/ELK-CPACF/blob/master/images/kibana-search-creation1.png)

Now we are good. Let's save this search with a name we can refer later. Saving searches enables you to reload them into Discover and use them as the basis for visualizations. Saving a search saves both the search query string and the currently selected index pattern.

**Action:** Now on the top right bar, click on **Save**, and name your save **vmstat-host** as follow:

![alt text](https://github.com/IBM/protect-data-on-linuxone-with-pervasive-encryption/blob/master/images/kibana-search-creation2.png)

If successful, you must see the following message on top of the Kibana interface:

![alt text](https://github.com/IBM/protect-data-on-linuxone-with-pervasive-encryption/blob/master/images/kibana-search-creation3.png)

## Creating a second search about Linux crypto data

You just create your first search about vmstat. Now, please create a new index about Linux encryption activity the with the following information:

* **Action:** Click on the left tab bar on **"Discover"**. 

* **Action:** Select the index **monitor-icastats** as follow:

![alt text](https://github.com/IBM/protect-data-on-linuxone-with-pervasive-encryption/blob/master/images/kibana-search-creation4.png)

The name of the index **monitor-icastats** should be visible as follow:

![alt text](https://github.com/IBM/protect-data-on-linuxone-with-pervasive-encryption/blob/master/images/kibana-search-creation5.png)

* **Action:** On **Available field MODE**, on the line of **Host**, Click on **add** field MODE.

* **Action:** Now on the top right bar, click on **Save**, and name your save **icastats-host**.

# 4. Creating your first "Visualizations"

## Creating visualization charts about Linux VMSTAT data

A Kibana dashboard displays a collection of visualizations and searches. You can arrange, resize, and edit the dashboard content and then save the dashboard so you can share it.

**Action:** Click on **Visualize** in the side navigation.

![alt text](https://github.com/IBM/protect-data-on-linuxone-with-pervasive-encryption/blob/master/images/kibana-visualize-creation0.png)

**Action:** Click the **Create new visualization** button or the **+** button:

![alt text](https://github.com/IBM/protect-data-on-linuxone-with-pervasive-encryption/blob/master/images/kibana-visualize-creation1.png)

To build a visualization from a saved search, click the name of the saved search you previously saved **vmstat-host**. This opens the visualization builder and loads the selected query. When you build a visualization from a saved search, any subsequent modifications to the saved search are automatically reflected in the visualization. To disable automatic updates, you can disconnect a visualization from the saved search.

**Action:** Choose the visualization type: **Visual Builder**

You can see below the Visual Builder that will help you to create your first visual chart. This tool can be highly customized according your dashboard design need. First of all, you need to select the "Index" that is the source of the data.


**Action:** Please, Click on **Panel Options** as show below:

![alt text](https://github.com/IBM/protect-data-on-linuxone-with-pervasive-encryption/blob/master/images/kibana-visualize-creation7.png)

From there, you can see that, data displayed in live above come from the Index pattern: **monitor-vmstat**. That is correct.

**Action:** Please, Click on **Data**, to move back on the chart visual builder.

It is now time to select some data to create an area charts. Let's create the **CPU Activity** chart together. VMSTAT data monitor CPU activity with the following field:
* cp-sy : CPU connsumed by the system.
* cp-id : CPU available and in idle state.
* cp-st : CPU in steady state.
* cp-us : CPU consummed by user activities.
* cp-wa : CPU is wait state.

It is now time for each of above data, to select them to be part of the same chart.

**Action:** On the Data section panel, in **Metrics** section, and in the **Aggregation** field, Select **Average** and then select the data **cp-sy**.

As you can see on top of the web page, the selected data is displayed. It is now time to stack others source of data that define a vmstat CPU activity.

**Action:** To stack a new source of data in the chart, please cick on **+** as show below. It result to create a new section for a new source of data.

![alt text](https://github.com/IBM/protect-data-on-linuxone-with-pervasive-encryption/blob/master/images/kibana-visualize-creation9.png)

Now, you understand how it works, so, please create a new section for each source of data listed below. Don't forget to select the **Average** aggregation before selecting the source of data. 
* cp-id : CPU available and in idle state.
* cp-st : CPU in steady state.
* cp-us : CPU consummed by user activities.
* cp-wa : CPU is wait state.

**Action:** To make the Visual Builder easier to use, please compress all your section by clicking on the **shrinker** button located at the left of the chart data color of each section. 

![alt text](https://github.com/IBM/protect-data-on-linuxone-with-pervasive-encryption/blob/master/images/images/kibana-visualize-creation11.png)

It will result the following:

![alt text](https://github.com/IBM/protect-data-on-linuxone-with-pervasive-encryption/blob/master/images/images/kibana-visualize-creation3.png)

This is your future chart, so you can also decide color of each data. To do so, you simply have to click on the color for each data section.

**Action:** Now on the top right bar, click on **Save**, and name your save **CPU**.

![alt text](https://github.com/IBM/protect-data-on-linuxone-with-pervasive-encryption/blob/master/images/kibana-visualize-creation4.png)

If successful, you must see the following message on top of the Kibana interface:

![alt text](https://github.com/IBM/protect-data-on-linuxone-with-pervasive-encryption/blob/master/images/kibana-visualize-creation5.png)

**Action:** Click on **Visualize** in the side navigation.

Now your job, is to create the following chart regarding the Index monitor-vmstat:  IO, Memory, Procs, Swap, System.
Your collection of visualization should like the following (this is your new target):

![alt text](https://github.com/IBM/protect-data-on-linuxone-with-pervasive-encryption/blob/master/images/kibana-visualize-creation6.png)

To ease the creation of your visuals, you can find below information you can use to succeed. Feel free to define your own colors.

* **IO** : Name of the visualization to be saved
  * io-bi
  * ui-bo

* **Memory**
  * memory-buff
  * memory-cache
  * memory-free
  * memory-swpd

* **Procs** : Name of the visualization to be saved
  * procs-b
  * procs-r

* **Swap** : Name of the visualization to be saved
  * swap-so
  * swap-si

* **System** : Name of the visualization to be saved
  * system-cs
  * system-in

## Creating visualizations about Linux crypto data

**Action:** Click on **Visualize** in the side navigation.

Now your job, is to create the following chart regarding the Index monitor-icastats:  AES, SHA, RSA.

Your collection of visualization **must** looks like the following (this is your new target):

![alt text](https://github.com/IBM/protect-data-on-linuxone-with-pervasive-encryption/blob/master/images/kibana-visualize-creation12.png)

To ease the creation of your visuals, you can find below information you can use to succeed. Feel free to define your own colors.

Don't forget for each create visuals to select the appropriate source of data **monitor-icastats** as show below:
![alt text](https://github.com/IBM/protect-data-on-linuxone-with-pervasive-encryption/blob/master/images/kibana-visualize-creation13.png)

* **RSA** : Name of the visualization to be saved
  * RSA-CRT
  * RSA-ME

* **AES**
  * AES-CBC
  * AES-CFB
  * AES-CMAC
  * AES-CTR
  * AES-ECB
  * AES-OFB
  * AES-XTS

* **SHA** : Name of the visualization to be saved
  * SHA-1
  * SHA2-256
  * SHA2-384
  * SHA2-512
  * DRBG-SHA-512

Once done, we can say this is a great achievement! We are now ready to create the Crypto Dashboard.

# 5. Creating your first dashboard

A Kibana dashboard displays a collection of visualizations and searches. You can arrange, resize, and edit the dashboard content and then save the dashboard so you can share it.

**Action:** Click on **Dashboard** in the side navigation.

![alt text](https://github.com/IBM/protect-data-on-linuxone-with-pervasive-encryption/blob/master/images/kibana-dashboard-creation1.png)

You have no dashboard yet, this is why it is empty. You are kindly invite to create your first dashboard. Let's do it.

**Action:** Click **Create new dashboard**. Then Click **Add**.

To add a visualization, select its name from the list of visualizations or click Add new visualization to create one. If you have a large number of visualizations, you can filter the list.

![alt text](https://github.com/IBM/protect-data-on-linuxone-with-pervasive-encryption/blob/master/images/kibana-dashboard-creation2.png)

**Action:** Add all the visualization you created. Click once on each vizualisation. This will add them on the dashboard.

The visualizations in the dashboard are stored in panels that you can move, resize, and delete. To start editing, open the dashboard and click Edit in the menu bar. To move a panel, click and hold the header of a panel and drag to the new location. To resize a panel, click the resize control on the lower right and drag to the new dimensions. Additional commands for managing the panel and its contents are in the gear menu in the upper right. Feel free to arrange their position in the dashboard.

You can find below a proposition for your crypto dashboard:

![alt text](https://github.com/IBM/protect-data-on-linuxone-with-pervasive-encryption/blob/master/images/kibana-dashboard-creation5.png)

**Action:** Now on the top right bar, click on **Save**, and name your save **Crypto Activity Monitoring**.

![alt text](https://github.com/IBM/protect-data-on-linuxone-with-pervasive-encryption/blob/master/images/kibana-dashboard-creation3.png)

If successful, you must see the following message on top of the Kibana interface:

![alt text](https://github.com/IBM/protect-data-on-linuxone-with-pervasive-encryption/blob/master/images/kibana-dashboard-creation4.png)

# 6. Sharing your first dashboard

You can either share a direct link to a Kibana dashboard, or embed the dashboard in a web page. Users must have Kibana access to view an embedded dashboard.

**Action:** From the dashboard you have created and you want to share, In the menu bar, click **Share**.

![alt text](https://github.com/IBM/protect-data-on-linuxone-with-pervasive-encryption/blob/master/images/kibana-dashboard-share0.png)

Copy the link you want to share or the iframe you want to embed. You can share the live dashboard or a static snapshot of the current point in time.

# 7. Using your first dashboard

You just created a crypto dashboard monitoring both the linux system activity and the hardware crypto activity. Using this dashboard, you can monitor over the time the following information:

Proc: 
-------
* r: How many processes are waiting for CPU time.
* b: Wait Queue - Process which are waiting for I/O (disk, network, user input,etc..) 


Memory: 
-----------
* swpd: shows how many blocks are swapped out to disk (paged). Total Virtual memory usage. 
* free: Idle Memory 
* buff: Memory used as buffers, like before/after I/O operations
* cache: Memory used as cache by the Operating System


Swap: 
---------
* si: How many blocks per second the operating system is swapping in. i.e Memory swapped in from the disk (Read from swap area to Memory)
* so: How many blocks per second the operating system is swaped Out. i.e Memory swapped to the disk (Written to swap area and cleared from Memory)

IO: 
------
* bi: Blocks received from block device - Read (like a hard disk) 
* bo: Blocks sent to a block device - Write

System: 
-------------
* in: The number of interrupts per second, including the clock. 
* cs: The number of context switches per second. 

CPU: 
--------
* us: percentage of cpu used for running non-kernel code. (user time, including  nice time) 
* sy: percentage of cpu used for running kernel code. (system time - network, IO interrupts, etc) 
id: cpu idle time in percentage.
* wa: percentage of time spent by cpu for waiting to IO.

AES:
-------------
* AES-CBC:  AES CBC mode of operation counter increases to indicate the use of the MSA Hardware instruction. 
* AES-CFB:  AES CFB mode of operation counter increases to indicate the use of the MSA Hardware instruction.
* AES-CMAC: AES CMAC mode of operation counter increases to indicate the use of the MSA Hardware instruction.
* AES-CTR:  AES CTR mode of operation counter increases to indicate the use of the MSA Hardware instruction.
* AEC-ECB:  AES ECB mode of operation counter increases to indicate the use of the MSA Hardware instruction.
* AES-OFB:  AES OFB mode of operation counter increases to indicate the use of the MSA Hardware instruction.
* AES-XTS:  AES XTS mode of operation counter increases to indicate the use of the MSA Hardware instruction.

RSA:
-------------
* RSA-CRT: RSA Chinese Reminder Theorem operation counter increases to indicate the use of the Hardware.
* RSA-ME: RSA Modulus Exponant operation counter increases to indicate the use of the Hardware.

SHA:
-------------
* SHA-1: SHA1 family hashing functions operation counter increases to indicate the use of the MSA Hardware instruction.
* SHA2-256: SHA2 family hashing functions operation counter increases to indicate the use of the MSA Hardware instruction.
* SHA2-384: SHA2 family hashing functions operation counter increases to indicate the use of the MSA Hardware instruction.
* SHA2-512: SHA2 family hashing functions operation counter increases to indicate the use of the MSA Hardware instruction.
* DRBG-SHA-512: The DRBG mechanisms developed and approved by NIST (as in SP 800-90Ar1) use modern algorithms as strong as SHA-512 and AES-256. Operation counter increases to indicate the use of the Hardware.

👍 Congratulations! This ends this ICP Code Pattern.
