FROM  --platform=linux/amd64 ubuntu:22.04 AS base
WORKDIR /usr/local/bin
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=America/Sao_Paulo

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update && apt-get upgrade -y && apt-get install -y sudo

FROM base AS setup

RUN adduser lucas
RUN echo "lucas:lucas" | chpasswd
RUN adduser lucas sudo
RUN echo "lucas ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER lucas
WORKDIR /home/lucas/stuff
COPY ./install.sh ./install.sh
RUN ./install.sh

FROM setup as copied
COPY . .

FROM copied
RUN ls
