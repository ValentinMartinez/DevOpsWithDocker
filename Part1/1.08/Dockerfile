FROM ubuntu:18.04
WORKDIR /usr/src/app
COPY exercise.sh .
RUN apt-get update && apt-get install -y curl && chmod +x exercise.sh
CMD ./exercise.sh