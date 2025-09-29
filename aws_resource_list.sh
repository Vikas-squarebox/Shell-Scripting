#!/bin/bash
########################################################################
# This script lists all AWS resources in the specified region using AWS CLI.
# Auther: Vikas/Devops
# Version: v0.0.1

#Supported AWS Services by the script
#1.EC2
#2.S3
#3.Lambda
#4.RDS
#5.DynamoDB
#6.VPC
#7.CloudFront
#8.ELB
#9.ECS
#10.EKS
#11.CloudWatch
#12.IAM
#13.SNS
#14.SQS
#15.Route53

# Usage : ./aws_resource_list.sh <AWS_REGION> <Service_Name>
# Example : ./aws_resource_list.sh us-east-1 ec2
########################################################################
# Check if the correct number of arguments are provided 

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <AWS_REGION> <Service_Name>"
    echo "Example: $0 us-east-1 ec2"
    exit 1
fi

# Assign input arguments to variables
AWS_REGION=$1
SERVICE_NAME=$2

#check if aws cli is installed
if ! command -v aws &> /dev/null; then
    echo "AWS CLI not found. Please install AWS CLI to use this script."
    exit 1
fi

#check if AWS CLI is configured
if [ ! -d ~/.aws ]; then
    echo "AWS CLI is not configured. Please configure it using 'aws configure' command."
    exit 1
fi

# Execute the AWS CLI command based on the service name

case $2 in
    ec2)
        aws ec2 describe-instances --region $1
        ;;
    s3)
        aws s3 ls --region $1
        ;;
    lambda)
        aws lambda list-functions --region $1
        ;;
    rds)
        aws rds describe-db-instances --region $1
        ;;
    dynamodb)
        aws dynamodb list-tables --region $1
        ;;
    vpc)
        aws ec2 describe-vpcs --region $1
        ;;
    cloudfront)
        aws cloudfront list-distributions --region $1
        ;;
    elb)
        aws elb describe-load-balancers --region $1
        ;;
    ecs)
        aws ecs list-clusters --region $1
        ;;
    eks)
        aws eks list-clusters --region $1
        ;;
    cloudwatch)
        aws cloudwatch list-metrics --region $1
        ;;
    iam)
        aws iam list-users --region $1
        ;;
    sns)
        aws sns list-topics --region $1
        ;;
    sqs)
        aws sqs list-queues --region $1
        ;;
    route53)
        aws route53 list-hosted-zones --region $1
        ;;
    *)
        echo "Unsupported service. Supported services are: ec2, s3, lambda, rds, dynamodb, vpc, cloudfront, elb, ecs, eks, cloudwatch, iam, sns, sqs, route53"
        exit 1
        ;;
esac




