FROM ubuntu:latest
RUN apt-get update \
    && apt-get install -y \
    curl \
    python3 \
    python3-venv

RUN groupadd -g 1000 pulumi \
    && useradd -u 1000 -g 1000 -m -s /usr/bin/bash pulumi

USER pulumi
RUN mkdir "/home/pulumi/workspace"
WORKDIR "/home/pulumi/workspace"

RUN curl --fail --location --output pulumi.tar.gz https://get.pulumi.com/releases/sdk/pulumi-v2.24.1-linux-x64.tar.gz \
    && tar zxf pulumi.tar.gz -C . \
    && mkdir $HOME/.pulumi \
    && cp -r pulumi/. $HOME/.pulumi/bin/ \
    && rm -f pulumi.tar.gz \
    && rm -rf pulumi
ENV PATH="/home/pulumi/.pulumi/bin:${PATH}"