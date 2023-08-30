#!/bin/bash

set -e

echo "enter value to create a tag: "
read v commit

if [ -z "$v" ] && [ -z "$commit" ]; then
  echo "Error: Missing parameters, Try run again with the version did you want and the commit hash"
  exit 1
fi

docker build -t img:${v} .
if [ "$?" -eq 0 ]; then
 docker tag img:${v} libbybinn1/img:0.1 
 git tag ${v} ${commit}
 git push origin main --tags
else
  echo "Build failed"
fi




