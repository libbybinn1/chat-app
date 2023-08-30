#!/bin/bash

# Get the version and commit hash from the user
echo "Enter the version: "
read version
echo "Enter the commit hash: "
read commit_hash

# Tag the image with the version and commit hash
docker tag img:0.0.0 $version-$commit_hash

# Build the image
docker build -t $version-$commit_hash .

# Push the image to the repository
docker push $version-$commit_hash

# Check if the image was pushed successfully
if [ $? -eq 0 ]; then
  echo "The image was pushed successfully!"
else
  echo "There was an error pushing the image."
fi