# Assignment
NOTE: CI-CD approach steps are added in CI-CD-Approach.docx .Please download this file to have a look. 

### Manual Deployment Steps

### Clone repo
    git clone https://github.com/NitishSK/Assignment.git

### Move to Assignment directory
```
   cd "Assignment"
```
### List all files and directory using below commands
```
   ls -ltrh
```
### Output:
```
drwxr-xr-x 3 root root 4.0K Sep  5 17:37 mediawiki
drwxr-xr-x 3 root root 4.0K Sep  5 17:43 database
-rw-r--r-- 1 root root 3.2K Sep  5 17:48 README.md
```
```
You will see two directory "database" and "mediawiki". These directory is divided based backend(mariaDB database for mediawiki) and frontend(mediawiki)
```
# Database:

## Move to database directory now by using below commands
```
  cd database
```
### Again list all files and directory of database using below commands
```
  ls -ltrh
```
### Output:
```
-rw-r--r-- 1 root root   24 Sep  5 11:44 README.md
-rw-r--r-- 1 root root  619 Sep  5 11:44 Dockerfile
-rwxr-xr-x 1 root root   70 Sep  5 11:44 run.sh
-rw-r--r-- 1 root root  246 Sep  5 11:44 init.sql
drwxr-xr-x 3 root root 4.0K Sep  5 11:45 chart
-rw-r--r-- 1 root root 1.6K Sep  5 17:43 Jenkinsfile
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

  1. Make sure you are inside database/chart

  2. Edit the image name and tag name of image in values.yaml

  3. Deploy helm chart (helm install wikidatabase --generate-name)

  4. Check release (helm ls )

  5. Check pod status (kubectl pod status/ kubectl get svc )

# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

# Mediawiki:

### Move to mediawiki directory now by using below commands 
```
    cd mediawiki
```
### Again list all files and directory of mediawiki using below commands
```
    ls -ltrh
```
### Output:
```
-rw-r--r-- 1 root root   24 Sep  5 11:44 README.md
-rw-r--r-- 1 root root 1.3K Sep  5 15:08 Dockerfile
-rw-r--r-- 1 root root  34M Sep  5 15:24 mediawiki-1.31.0.tar.gz
-rw-r--r-- 1 root root  109 Sep  5 16:57 php.ini
-rw-r--r-- 1 root root  382 Sep  5 16:59 virtualhost.conf
drwxr-xr-x 3 root root 4.0K Sep  5 17:01 chart
-rw-r--r-- 1 root root 1.6K Sep  5 17:37 Jenkinsfile
```

>> Dockerfile : Docker file to create image mediawiki

>> mediawiki-1.31.0.tar.gz: source code for mediawiki

>> virtualhost.conf : apache virtual hosting file for media wiki

>> php.ini: Basic php configuration file 

### Steps to create images for mediawiki:

  1. Make sure you are inside mediawiki directory

  2. Docker build . -t "IMAGE_NAME:TAG"

  3. Tag docker images based on the repo name (docker tag xxxx:v1 xyz/xxxx:v1)

  4. Push image to your registery (docker push xyz/xxxx:v1)


### Steps to Deploy helm chart of mediawiki

  1. Make sure you are inside mediawiki/chart/

  2. Edit the image name and tag name of image in values.yaml

  3. Deploy helm chart (helm install mediawiki --generate-name)

  4. Check release (helm ls )

  5. Access mediawiki app using loadbalancer DNS (http://{DNS loadbalancer:80/mediawiki/}) 
