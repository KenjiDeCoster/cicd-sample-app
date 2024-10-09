#!/bin/bash
set -euo pipefail

# Variables
REPO_B_URL="https://github.com/docker/getting-started/archive/refs/heads/main.zip"
TARGET_DIR="C:\Users\kenji\Documents\- Hogent\Jaar 3\Infrastructure Automation\infra-24-25-KenjiDeCoster\dockerlab\cicd-sample-app"
TEMP_DIR=$(mktemp -d)

# Download the repository as a zip file
curl -L $REPO_B_URL -o "$TEMP_DIR/repository_B.zip"

# Check if the download was successful
if [ $? -ne 0 ]; then
    echo "Failed to download repository B."
    exit 1
fi

# Unzip the downloaded file
unzip "$TEMP_DIR/repository_B.zip" -d $TEMP_DIR

# Check if the unzip was successful
if [ $? -ne 0 ]; then
    echo "Failed to unzip the repository."
    exit 1
fi

# Copy the specific folder from the unzipped content to repository A
cp -r "$TEMP_DIR/repository_B-main/getting-started-master" "$TARGET_DIR"

# Check if the copy was successful
if [ $? -eq 0 ]; then
    echo "Folder copied successfully!"
else
    echo "Failed to copy the folder."
    exit 1
fi

# Clean up temporary files
rm -rf $TEMP_DIR

cd getting-started-master/app

cat Dockerfile << _EOF_
FROM node:20-alpine
RUN apk add --no-cache python3 g++ make
WORKDIR /app
COPY . .
RUN yarn install --production
CMD ["node", "/app/src/index.js"]
_EOF_

docker build -t getting-started .
docker run -dp 3000:3000 getting-started