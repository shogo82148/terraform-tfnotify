FROM alpine:latest
LABEL maintainer="Ichinose Shogo <shogo82148@gmail.com>"

ARG TERRAFORM_VERSION
ARG TERRAFORM_SHA256SUM

RUN apk update && apk add openssl ca-certificates && rm -rf /var/cache/apk/*

ENV TFNOTIFY_VERSION=0.5.0 TFNOTIFY_SHA256SUM=410c7e4461d5a66adb0e7b1c9c00616307a724dc741d427f07507d6a134641f7
RUN mkdir -p /tmp/tfnotify && cd /tmp/tfnotify \
    && wget -O tfnotify.tar.gz -q https://github.com/mercari/tfnotify/releases/download/v${TFNOTIFY_VERSION}/tfnotify_${TFNOTIFY_VERSION}_linux_amd64.tar.gz \
    && echo "$TFNOTIFY_SHA256SUM  tfnotify.tar.gz" | sha256sum -c - \
    && tar xzvf tfnotify.tar.gz \
    && mv "/tmp/tfnotify/tfnotify" /bin \
    && cd && rm -rf "/tmp/tfnotify"

RUN wget -O terraform.zip -q https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
    && echo "$TERRAFORM_SHA256SUM  terraform.zip" | sha256sum -c - \
    && unzip terraform.zip -d /bin \
    && rm -f terraform.zip

ENTRYPOINT ["/bin/sh"]
