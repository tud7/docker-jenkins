FROM ubuntu
LABEL maintainer "Tu Duong <tduongcs@gmail.com>"
COPY ./ /code
WORKDIR /code
EXPOSE 8080

RUN apt-get -y update && \
    apt-get -y install git

RUN apt-get -y update && \
    apt-get -y install gnupg && \
    apt-get -y install wget && \
    wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | apt-key add

RUN echo "deb https://pkg.jenkins.io/debian-stable binary/" >> /etc/apt/sources.list

RUN apt-get -y update && \
    DEBIAN_FRONTEND="noninteractive"  apt-get -y install openjdk-8-jdk && \
    apt-get -y install jenkins
