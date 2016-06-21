# provisioning-with-chef
Provisioning microservices application with Chef. 
Vagrant is used to launch:
1. Chef Server 
2. Workstation 
3. DB Server 
4. API Server 

Cookbooks for DB Server 
1. Installs MySQL 
2. Changes root password to 'password'
3. Allows root to login from anywhere 
4. Creates 'capsule' database and pupulates initial data 
 
Cookbook for API Server 
1. Installs Java 8
2. Creates 6 services in /etc/init using erb templates
3. Starts each of the microservice 
