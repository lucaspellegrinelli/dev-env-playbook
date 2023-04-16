FROM ubuntu:22.04 AS base
WORKDIR /usr/local/bin
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y sudo software-properties-common curl git build-essential && \
    apt-add-repository -y ppa:ansible/ansible && \
    apt-get update && \
    apt-get install -y curl git ansible build-essential && \
    apt-get clean autoclean && \
    apt-get autoremove --yes

FROM base AS setup
ARG TAGS

RUN useradd -m lucas && echo "lucas:password" | chpasswd && usermod -aG sudo lucas
RUN echo "lucas ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
RUN chown -R lucas:lucas /home/lucas
RUN chmod 755 /home/lucas

USER lucas
WORKDIR /home/lucas/stuff

FROM setup
COPY . .
