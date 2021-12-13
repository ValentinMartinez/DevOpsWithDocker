#!/bin/sh

git clone $GITHUB_REPO ./src
cd src
tar -czf ../src.tar.gz .
cd ..

IMG_NM=$DOCKERHUB_USER/$DOCKER_IMAGE_NAME

curl --unix-socket /var/run/docker.sock \
    -H "Content-Type:application/json" \
    -X POST http://localhost/build?t=$IMG_NM \
    --data-binary "@src.tar.gz"

JSON=$(echo "{\"username\": \"$DOCKERHUB_USER\", \"password\":\"$DOCKERHUB_PASSWORD\" }" | base64)
curl --unix-socket /var/run/docker.sock \
    -H "X-Registry-Auth: $JSON" \
    -X POST http://localhost/images/$IMG_NM/push