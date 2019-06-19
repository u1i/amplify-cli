FROM ubuntu:18.04
MAINTAINER uhitzel@axway.com
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update
#ENV TZ=Asia/Singapore
#RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get -y install curl vim wget python3-pip awscli
WORKDIR /tmp
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
RUN chmod +x ./kubectl
RUN mv ./kubectl /usr/local/bin/kubectl
RUN curl -Lo kops https://github.com/kubernetes/kops/releases/download/$(curl -s https://api.github.com/repos/kubernetes/kops/releases/latest | grep tag_name | cut -d '"' -f 4)/kops-linux-amd64
RUN chmod +x ./kops
RUN mv ./kops /usr/local/bin/kops
RUN wget https://get.helm.sh/helm-v2.14.1-linux-amd64.tar.gz
RUN tar -xvzf helm-v2.14.1-linux-amd64.tar.gz
RUN mv /tmp/linux-amd64/helm /usr/local/bin/helm
WORKDIR /root