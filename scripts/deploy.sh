#!/bin/bash

set -e

echo "🚀 Starting Employee Check-in Website Deployment..."

# Check if terraform is installed
if ! command -v terraform &> /dev/null; then
    echo "❌ Terraform is not installed. Please install Terraform first."
    exit 1
fi

# Check if AWS CLI is installed
if ! command -v aws &> /dev/null; then
    echo "❌ AWS CLI is not installed. Please install AWS CLI first."
    exit 1
fi

# Check AWS credentials
if ! aws sts get-caller-identity &> /dev/null; then
    echo "❌ AWS credentials not configured. Please run 'aws configure' first."
    exit 1
fi

# Navigate to terraform directory
cd terraform

# Copy website files
echo "📁 Copying website files..."
mkdir -p website
cp ../website/index.html website/

# Initialize Terraform
echo "🔧 Initializing Terraform..."
terraform init

# Plan deployment
echo "📋 Planning deployment..."
terraform plan

# Ask for confirmation
read -p "Do you want to proceed with deployment? (y/N): " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    # Apply changes
    echo "🌟 Deploying infrastructure..."
    terraform apply -auto-approve
    
    echo "✅ Deployment completed successfully!"
    echo
    echo "📊 Deployment Information:"
    terraform output -json deployment_info | jq -r 'to_entries[] | "\(.key): \(.value)"'
    
    echo
    echo "🌐 Your website is available at:"
    terraform output -raw cloudfront_url
    
    echo
    echo "📝 Note: CloudFront distribution may take 10-15 minutes to fully deploy."
else
    echo "❌ Deployment cancelled."
fi