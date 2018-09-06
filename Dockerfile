FROM efisef/lein-base
MAINTAINER Luke Tomlin "luke@efisef.io"

RUN apk update

RUN apk add redis

RUN apk add docker

RUN apk add git

RUN apk add python
RUN curl -O https://bootstrap.pypa.io/get-pip.py
RUN python get-pip.py

ENV PHANTOMJS_ARCHIVE="phantomjs.tar.gz"
RUN echo '@edge http://nl.alpinelinux.org/alpine/edge/main'>> /etc/apk/repositories \
	&& apk --update add curl

RUN curl -Lk -o $PHANTOMJS_ARCHIVE https://github.com/fgrehm/docker-phantomjs2/releases/download/v2.0.0-20150722/dockerized-phantomjs.tar.gz \
	&& tar -xf $PHANTOMJS_ARCHIVE -C /tmp/ \
	&& cp -R /tmp/etc/fonts /etc/ \
	&& cp -R /tmp/lib/* /lib/ \
	&& cp -R /tmp/lib64 / \
	&& cp -R /tmp/usr/lib/* /usr/lib/ \
	&& cp -R /tmp/usr/lib/x86_64-linux-gnu /usr/ \
	&& cp -R /tmp/usr/share/* /usr/share/ \
	&& cp /tmp/usr/local/bin/phantomjs /usr/bin/ \
	&& rm -fr $PHANTOMJS_ARCHIVE  /tmp/*

ENV GCLOUD_SDK_VERSION="215.0.0"

RUN wget https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-$GCLOUD_SDK_VERSION-linux-x86_64.tar.gz
RUN tar xvzf google-cloud-sdk-$GCLOUD_SDK_VERSION-linux-x86_64.tar.gz
RUN ./google-cloud-sdk/install.sh -q

RUN apk add --update coreutils && rm -rf /var/cache/apk/*

