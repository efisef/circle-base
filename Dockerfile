FROM efisef/lein-base

RUN apk update

RUN apk add redis

RUN apk add docker

RUN apk add git

RUN apk add python
RUN curl -O https://bootstrap.pypa.io/get-pip.py
RUN python get-pip.py

RUN wget https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-201.0.0-linux-x86_64.tar.gz
RUN tar xvzf google-cloud-sdk-201.0.0-linux-x86_64.tar.gz
RUN ./google-cloud-sdk/install.sh -q
RUN source /root/.bashrc
