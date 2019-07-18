FROM alpine:latest
LABEL maintainer="Ichinose Shogo <shogo82148@gmail.com>"

ENV TERRAFORM_VERSION=0.12.4 TERRAFORM_SHA256SUM=0231562f26262de233e8e8fac668196af21b7aff355bb04f3ee1606cca239c0a

RUN apk update && apk add openssl ca-certificates && rm -rf /var/cache/apk/*

ADD https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip ./
RUN echo "$TERRAFORM_SHA256SUM  terraform_${TERRAFORM_VERSION}_linux_amd64.zip" | sha256sum -c - \
    && unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /bin \
    && rm -f terraform_${TERRAFORM_VERSION}_linux_amd64.zip

ENV TFNOTIFY_VERSION=0.3.0 TFNOTIFY_SHA256SUM=5ab65b9d6638fe269c30ec81c0e3bdaa06368e3b31d979869061271afdb2caaa
ADD https://github.com/mercari/tfnotify/releases/download/v${TFNOTIFY_VERSION}/tfnotify_v${TFNOTIFY_VERSION}_linux_amd64.tar.gz ./
RUN echo "$TFNOTIFY_SHA256SUM  tfnotify_v${TFNOTIFY_VERSION}_linux_amd64.tar.gz" | sha256sum -c - \
    && tar xzvf tfnotify_v${TFNOTIFY_VERSION}_linux_amd64.tar.gz -C /bin \
    && rm -f tfnotify_v${TFNOTIFY_VERSION}_linux_amd64.tar.gz

ENTRYPOINT ["/bin/sh"]
