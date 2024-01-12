#! /bin/bash

# Env
# Enter you AWS account ID and region
AWS_DEFAULT_REGION='ca-central-1'
AWS_ACCOUNT_ID='570580688935'

# ECR login
#aws ecr get-login-password --region ca-central-1 | docker login --username AWS --password-stdin 570580688935.dkr.ecr.ca-central-1.amazonaws.com

# pull the new image
#docker pull 570580688935.dkr.ecr.ca-central-1.amazonaws.com/xtb-mo-st-app:latest

# run the container
#docker run -d -p 8501:8501 570580688935.dkr.ecr.ca-central-1.amazonaws.com/xtb-mo-st-app:latest

# ECR login
aws ecr get-login-password --region $AWS_DEFAULT_REGION | docker login --username AWS --password-stdin "$AWS_ACCOUNT_ID.dkr.ecr.$AWS_DEFAULT_REGION.amazonaws.com"

# pull the new image
docker pull 570580688935.dkr.ecr.ca-central-1.amazonaws.com/webapp:latest

# run the container
docker run -d -p 8501:8501 570580688935.dkr.ecr.ca-central-1.amazonaws.com/webapp:latest
