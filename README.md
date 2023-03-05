# Assignment
NOTE: CI-CD approach steps are added in CI-CD-Approach.docx .Please download this file to have a look. 

### Manual Deployment Steps

### Clone repo
    git clone https://github.com/nitishNec/WorkAssignment.git

### Move to Assignment directory
```
   cd "WorkAssignment"
```
### List all files and directory using below commands
```
   ls -ltrh
```
### Output:
```
drwxr-xr-x 3 root root 4.0K Mar  5 17:37 backend/database
drwxr-xr-x 3 root root 4.0K Mar  5 17:37 cluster
drwxr-xr-x 3 root root 4.0K Mar  5 17:43 frontend/mediawiki
-rw-r--r-- 1 root root 3.2K Mar  5 17:48 README.md
-rw-r--r-- 1 root root 3.2K Mar  5 17:48 CI-CD-Approach-Using-GitOps.docx
```
```
You will see two directory "database" and "mediawiki". These directory is divided based on backend(mariaDB database for mediawiki) and frontend(mediawiki)
```

# kops k8s cluster on AWS:

## Move to cluster directory now by using below commands
```
  cd cluster
```
### Again list all files and directory of cluster using below commands
```
  ls -ltrh
```
### Output:
```
-rw-r--r-- 1 root root 1.6K Mar  5 17:43 kops-k8s-cluster.sh
```

>> kops-k8s-cluster.sh : This file is used to provision k8s cluster using kops binary  
>> Pre-requisite to provision k8s cluster : Install kops binary , kubectl ,aws cli on one of EC2 machine from following official page of each component 
>> Configure AWS cli using credential 
>> Create s3 bucket to store all config for k8s cluster 
>> kops-k8s-cluster.sh: Execute this file on shell using this commands  "sh -x  kops-k8s-cluster.sh"
>> once script execution get completed run : "kubectl get nodes" to check the node status 
>> Now K8s cluster is ready to use please follow below steps to deply app 

# Database:

## Move to database directory now by using below commands
```
  cd backend/database
```
### Again list all files and directory of database using below commands
```
  ls -ltrh
```
### Output:
```
-rw-r--r-- 1 root root   24 Mar  5 11:44 README.md
-rw-r--r-- 1 root root  619 Mar  5 11:44 Dockerfile
-rwxr-xr-x 1 root root   70 Mar  5 11:44 run.sh
-rw-r--r-- 1 root root  246 Mar  5 11:44 init.sql
drwxr-xr-x 3 root root 4.0K Mar  5 11:45 chart
-rw-r--r-- 1 root root 1.6K Mar  5 17:43 Jenkinsfile
```

>> Dockerfile : Docker file to create image of mariaDB

>> init.sql: Sql query to create database and provide required 

>> chart/wikidatabase: Helm chart for database

>> run.sh: init.sql query executor script 


### Steps to create images for database:

  1. Make sure you are inside database directory

  2. Docker build . -t "IMAGE_NAME:TAG"

  3. Tag docker images based on the repo name (docker tag xxxx:v1 xyz/xxxx:v1)

  4. Push image to your registery (docker push xyz/xxxx:v1)


### Steps to Deploy helm chart of database

  1. Make sure you are inside backend/database/chart

  2. Edit the image name and tag name of image in values.yaml

  3. Deploy helm chart (helm install wikidatabase --generate-name)

  4. Check release (helm ls )

  5. Check pod status (kubectl pod status/ kubectl get svc )

# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

# Mediawiki:

### Move to mediawiki directory now by using below commands 
```
    cd frontend/mediawiki
```
### Again list all files and directory of mediawiki using below commands
```
    ls -ltrh
```
### Output:
```
-rw-r--r-- 1 root root   24 Mar  5 11:44 README.md
-rw-r--r-- 1 root root 1.3K Mar  5 15:08 Dockerfile
-rw-r--r-- 1 root root  34M Mar  5 15:24 mediawiki-1.39.2.tar.gz
-rw-r--r-- 1 root root  109 Mar  5 16:57 php.ini
-rw-r--r-- 1 root root  382 Mar  5 16:59 virtualhost.conf
drwxr-xr-x 3 root root 4.0K Mar  5 17:01 chart
-rw-r--r-- 1 root root 1.6K Mar  5 17:37 Jenkinsfile
```

>> Dockerfile : Docker file to create image mediawiki

>> mediawiki-1.39.2.tar.gz: source code for mediawiki

>> virtualhost.conf : apache virtual hosting file for media wiki

>> php.ini: Basic php configuration file 

### Steps to create images for mediawiki:

  1. Make sure you are inside mediawiki directory

  2. Docker build . -t "IMAGE_NAME:TAG"

  3. Tag docker images based on the repo name (docker tag xxxx:v1 xyz/xxxx:v1)

  4. Push image to your registery (docker push xyz/xxxx:v1)


### Steps to Deploy helm chart of mediawiki

  1. Make sure you are inside frontend/mediawiki/chart/

  2. Edit the image name and tag name of image in values.yaml

  3. Deploy helm chart (helm install mediawiki --generate-name)

  4. Check release (helm ls )

  5. Access mediawiki app using loadbalancer DNS (http://{DNS loadbalancer:80/mediawiki/}) 
