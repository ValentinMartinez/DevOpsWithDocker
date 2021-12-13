FROM ubuntu:18.04

WORKDIR /usr/image-builder

COPY ./image-builder.sh .

RUN apt-get update && apt-get install -y curl git

ENTRYPOINT ["/bin/bash","./image-builder.sh"]