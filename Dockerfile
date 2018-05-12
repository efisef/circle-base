FROM efisef/lein-base

RUN apk update

RUN apk add redis

RUN apk add docker

RUN apk add git

RUN apk add python
RUN curl -O https://bootstrap.pypa.io/get-pip.py
RUN python get-pip.py

RUN pip install awscli --upgrade
RUN aws --version
RUN aws configure set default.region eu-west-2
RUN aws configure set default.output json
