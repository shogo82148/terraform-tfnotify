FROM alpine:latest
LABEL maintainer="Ichinose Shogo <shogo82148@gmail.com>"

ENV TERRAFORM_VERSION=0.12.6 TERRAFORM_SHA256SUM=6544eb55b3e916affeea0a46fe785329c36de1ba1bdb51ca5239d3567101876f

RUN apk update && apk add openssl ca-certificates && rm -rf /var/cache/apk/*

ADD https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip ./
RUN echo "$TERRAFORM_SHA256SUM  terraform_${TERRAFORM_VERSION}_linux_amd64.zip" | sha256sum -c - \
    && unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /bin \
    && rm -f terraform_${TERRAFORM_VERSION}_linux_amd64.zip

ENV TFNOTIFY_VERSION=0.3.1 TFNOTIFY_SHA256SUM=385cc950669d080c1750a89f4dddf0019d8301ee022c7e0883bced07f6b26348
ADD https://github.com/mercari/tfnotify/releases/download/v${TFNOTIFY_VERSION}/tfnotify_v${TFNOTIFY_VERSION}_linux_amd64.tar.gz ./
RUN echo "$TFNOTIFY_SHA256SUM  tfnotify_v${TFNOTIFY_VERSION}_linux_amd64.tar.gz" | sha256sum -c - \
    && tar xzvf tfnotify_v${TFNOTIFY_VERSION}_linux_amd64.tar.gz -C /tmp \
    && mv "/tmp/tfnotify_v${TFNOTIFY_VERSION}_linux_amd64/tfnotify" /bin \
    && rm -rf "/tmp/tfnotify_v${TFNOTIFY_VERSION}_linux_amd64" \
    && rm -f tfnotify_v${TFNOTIFY_VERSION}_linux_amd64.tar.gz

ENTRYPOINT ["/bin/sh"]
