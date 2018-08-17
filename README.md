# Protect data on LinuxONE with "Pervasive Encryption"
Protect your data on data LinuxONE using pervasive encryption with nearly no CPU overhead.

In this Code Pattern, you will build and deploy a crypto dashboard with IBM Cloud private running in the LinuxONE Community Cloud.

IBM Cloud Private is a private cloud platform for developing and running workloads locally. It is an integrated environment that enables you to design, develop, deploy and manage on-premises, containerized cloud applications behind a firewall. It includes the container orchestrator Kubernetes, a private image repository, a management console and monitoring frameworks.

When you will complete this Code Pattern, you will understand how to:
* Configure a LinuxONE Linux guest to use the hardware cryptographic acceleration.
* Use the LinuxONE crypto APIS to get monitoring data about hardware cryptographic use.
* Build a Docker image from an existing application.
* Deploy a Docker image to IBM Cloud Private.
* Run the existing application using the IBM Cloud Private catalog.
* Build an ELK Dashboard to monitor hardware cryptographic activity of LinuxONE Linux guest.

# Architecture
This journey requires an existing Linux on IBM Z environment of your choice as starting point. From there, and after some optimization, captured encryption activity will be sent to a private cloud environment in order to be magnified thanks to an ELK dashboard. IBM Cloud private has been configured into the LinuxOne LinuxONE Community Cloud.

![Image of the Crypto Stack](https://github.com/guikarai/ELK-CPACF/blob/master/images/code-pattern-architecture.png)

1. User optimizes, collects and pushes Enterprise Legacy environment encryption activity to the IBM Private Cloud.
3. User deploys an ELK stack running on IBM Cloud private, and sources encryption activity data from Enterprise Legacy environment.
3. User creates and then enjoys a crypto activity dashboard running on IBM Cloud Private.

# Included components

* [IBM Cloud private](https://www.ibm.com/us-en/marketplace/ibm-cloud-private/details)
* [Ubuntu](https://www.ubuntu.com/)
* [LinuxONE Crypto](https://www.ibm.com/it-infrastructure/linuxone/capabilities/secure-cloud)

# Featured technologies

* [Docker](https://www.docker.com/)
* [IBM LinuxONE](https://www.ibm.com/it-infrastructure/linuxone)
* [ELK](https://www.elastic.co/fr/elk-stack)

# Steps

## Step 1 - [Enabling Linux to use hardware encryption](https://github.com/IBM/protect-data-on-linuxone-with-pervasive-encryption/blob/master/part1.md)

    1. Introduction to the pervasive encryption
    2. Introduction to the Linux crypto stack
    2. Enabling Linux to use the Hardware
    3. Enabling OpenSSL to use the hardware acceleration support
    4. Checking Hardware Crypto functions

## Step 2 - [Deploying ELK microservice from the IBM Cloud private catalog](https://github.com/IBM/protect-data-on-linuxone-with-pervasive-encryption/blob/master/part2.md)
    
    1. What the ELK..?!
    2. What to Keep in mind about ELK?
    3. Discover the Helm chart from the calalog
    4. Configure and install your ELK microservices
    5. Access your ELK microservice

## Step 3 - [Pushing crypto activity data to the ICP ELK microservice](https://github.com/IBM/protect-data-on-linuxone-with-pervasive-encryption/blob/master/part3.md)
    
    1. Cloning the protect data on linuxone with pervasive encryption git repository
    2. Tooling for ELK crypto stack
    3. Feeding your ELK crypto dashboard
    
## Step 4 - [Creating a crypto dashboard with ELK microservice](https://github.com/IBM/protect-data-on-linuxone-with-pervasive-encryption/blob/master/part4.md)

    1. Accessing to Kibana
    2. Sourcing the Elasticsearch DataSource
    3. Creating your first "Searchs" with Kibana
    4. Creating your first "charts" with Kibana
    5. Creating your first dashboard with Kibana
    6. Sharing your first crypto dashboard
    7. Using your first dashboard
