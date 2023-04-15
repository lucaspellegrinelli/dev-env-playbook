FROM ubuntu:focal AS base
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

FROM base AS lucas
ARG TAGS
RUN addgroup --gid 1000 lucas
RUN adduser --gecos lucas --uid 1000 --gid 1000 --disabled-password lucas
USER lucas
WORKDIR /home/lucas

FROM lucas
COPY . .
CMD ["sh", "-c", "ansible-playbook $TAGS playbook.yml"]
