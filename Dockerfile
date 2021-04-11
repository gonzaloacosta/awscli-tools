FROM alpine

LABEL name="AWS CLI Tools Set" \
        maintainer="Gonzalo Acosta <gonzaloacostapeiro@gmail.com>" \
        vendor="gonzaloacosta.com" \
        release="1" \
        summary="AWS CLI Tools" 

RUN apk --no-cache --update add \
        bash \
        less \
        groff \
        jq \
        git \
        curl \
        python \
        py-pip

RUN pip install --upgrade pip \
        awsebcli \
        awscli

RUN curl -L https://github.com/barnybug/cli53/releases/download/0.8.12/cli53-linux-386 > /usr/bin/cli53 && \
    chmod +x /usr/bin/cli53

RUN mkdir ~/.aws
