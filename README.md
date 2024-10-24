# Real-Time Data Streaming using Apache Nifi, AWS, Snowpipe, Stream & Task
## Introduction
## Architecure
![Architecture](https://github.com/nvkhoa14/nvkhoa14-Real-time-Data-Streaming/blob/master/rsc/Architecture.png)
## Services Used
1. **Docker**: Docker provides the ability to package and run an application in a loosely isolated environment called a container.

2. **EC2(Amazon Elastic Compute Cloud)**: Amazon EC2 provides on-demand, scalable computing capacity in the Amazon Web Services (AWS) Cloud. Using Amazon EC2 reduces hardware costs so we can develop and deploy applications faster. EC2 can lanch as many or as few virtual servers, configure security and networking, and manage storage. Specically, EC2 allows us to handle compute-heavy tasks, such as monthly or yearly processes, or spikes in website traffic.

3. **Apache Nifi**: Nifi is a data intergration tool which provides a web-based interface for designing, controlling and monitoring data flows. Apache Nifi allows us to use multiple processors(from Amazon EC2) and groups them together. It offering scalability, fexibility, data provenance and extensibility with an easy-to-use user interface.
   
4. **S3(Amazon Simple Storage Service)**: Amazon S3 is a scalable cloud storage solution by AWS that allows users to store and retrieve data from anywhere on the web, offering high durability, security features, and seamless integration with other AWS services.
   
5. **Snowpipe**: Snowpipe is a continuous data loading service by Snowflake that automates the process of loading data from external sources like AWS S3 into Snowflake. It listens for new data in S3 buckets and automatically ingests it in near real-time, providing a seamless integration for real-time analytics and reducing the need for manual data loading processes.
   
6. **Snowflake**: Snowflake is a cloud-based data warehousing platform that allows for scalable storage, querying, and analysis of large datasets. It supports structured and semi-structured data, making it ideal for high-performance analytics. With built-in capabilities for auto-scaling, Snowflake integrates seamlessly with AWS services, enabling efficient data storage, transformation, and analysis for insights.

## Project execution Flow
Create and connect to an EC2 instance (follow `rsc/ec2-command`) → Install Docker and run docker file `docker-exp` that contains Jupyter Lab and Apache Nifi → Extract data by running `faker.ipynb` repeatedly → Modify Nifi pipeline → Store raw data in S3 → Connect to Snowflake and load data to *customer_raw* table → Merge *customer_raw* with *customer* table → Store data that was updated, inserted and deleted from merging process or changing by user in *customer_history*.

Each step include extract by EC2, transform and load into S3, Snowflake is running in real-time.
