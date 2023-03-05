#!/bin/bash
AWS_REGION="us-east-1"
aws_project=$1
master_node_instance_type=$2
Number_of_master_node=$3
worker_node_instance_type=$4
Number_of_worker_node=$5
Kubernetes_cluster_name_prefix=$6
S3_bucket_name=$7
Kubernetes_cluster_name=$Kubernetes_cluster_name_prefix".k8s.local"
AWS_Bucket_Url="s3://"$S3_bucket_name

echo $Kubernetes_cluster_name
echo $S3_bucket_name
echo $aws_zone
echo $master_node_instance_type
echo $worker_node_instance_type
echo $Number_of_master_node
echo $Number_of_worker_node
aws_project="Assignment_Test"
echo $PWD
export AWS_REGION=$AWS_REGION
export KOPS_STATE_STORE=$AWS_Bucket_Url
export NAME=$Kubernetes_cluster_name
kops create cluster --zones us-east-1a --master-size ${master_node_instance_type} --master-count ${Number_of_master_node} --node-size ${worker_node_instance_type} --node-count ${Number_of_worker_node} ${NAME} --yes

sleep 300

if [ $? -eq 0 ];
then
echo "Kubernetes cluster  has been configured successfully"
else
echo "Error!!! Please try again after some time"
fi
#kops delete cluster --name=kubetestcluster.k8s.local --state=s3://kops-bucket-config-data --yes
