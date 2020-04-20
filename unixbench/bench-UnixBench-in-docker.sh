#!/bin/sh

image_id=$(docker build image/ -q)

echo "INFO: this might take several minutes to complete"
docker run --privileged $image_id

