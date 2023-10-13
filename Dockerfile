FROM ubuntu:22.04

RUN apt-get update && \
    apt-get install -y sudo ansible

RUN useradd -m -s /bin/bash lucas && \
    echo "lucas ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/nopasswd

COPY . /home/lucas/dev-env-playbook/

ARG VAULT_PASSWORD
RUN echo "$VAULT_PASSWORD" > /home/lucas/dev-env-playbook/vault_password.txt

USER lucas

WORKDIR /home/lucas

RUN cd dev-env-playbook && \
    ansible-playbook playbook.yml --vault-password-file vault_password.txt

EXPOSE 8080

RUN sudo apt-get install -y ttyd

CMD ttyd -p 8080 zsh
