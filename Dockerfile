FROM anapsix/alpine-java:9

RUN apk update

RUN apk add ca-certificates wget
RUN update-ca-certificates
RUN wget https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein
RUN chmod a+x lein
RUN mv lein /usr/local/bin/

RUN apk add redis

RUN apk add python
RUN curl -O https://bootstrap.pypa.io/get-pip.py
RUN python get-pip.py

RUN pip install awscli --upgrade
RUN aws --version
RUN aws configure set default.region eu-west-2
RUN aws configure set default.output json
