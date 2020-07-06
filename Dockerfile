FROM alpine:latest
LABEL maintainer="Ichinose Shogo <shogo82148@gmail.com>"

ARG TERRAFORM_VERSION
ARG TERRAFORM_SHA256SUM

RUN apk update && apk add openssl ca-certificates && rm -rf /var/cache/apk/*

ENV TFNOTIFY_VERSION=0.6.2 TFNOTIFY_SHA256SUM=ebc32afb0a60ba8d504f37d3f9590837b58fb4222c690cb547b5ae98791105b3
RUN mkdir -p /tmp/tfnotify && cd /tmp/tfnotify \
    && wget -O tfnotify.tar.gz -q https://github.com/mercari/tfnotify/releases/download/v${TFNOTIFY_VERSION}/tfnotify_linux_amd64.tar.gz \
    && echo "$TFNOTIFY_SHA256SUM  tfnotify.tar.gz" | sha256sum -c - \
    && tar xzvf tfnotify.tar.gz \
    && mv "/tmp/tfnotify/tfnotify" /bin \
    && cd && rm -rf "/tmp/tfnotify"

RUN wget -O terraform.zip -q https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
    && echo "$TERRAFORM_SHA256SUM  terraform.zip" | sha256sum -c - \
    && unzip terraform.zip -d /bin \
    && rm -f terraform.zip

ENTRYPOINT ["/bin/sh"]
