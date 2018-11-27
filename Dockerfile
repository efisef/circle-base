FROM efisef/clj-base
MAINTAINER Luke Tomlin "luke@efisef.io"

RUN apt-get update

RUN yes | apt-get install redis docker git python

RUN curl -O https://bootstrap.pypa.io/get-pip.py
RUN python get-pip.py

ENV GCLOUD_SDK_VERSION="226.0.0"

RUN wget https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-$GCLOUD_SDK_VERSION-linux-x86_64.tar.gz
RUN tar xvzf google-cloud-sdk-$GCLOUD_SDK_VERSION-linux-x86_64.tar.gz
RUN ./google-cloud-sdk/install.sh -q

RUN curl https://sh.rustup.rs -sSf | sh -s -- -y
ENV PATH="/root/.cargo/bin:$PATH"
