FROM ubuntu:22.04

RUN apt update && apt install -yqq apparmor-utils lsb-release ca-certificates curl gnupg &&\
        mkdir -p /etc/apt/keyrings && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg &&\
        echo  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null &&\
        apt update && apt install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
COPY ./docker-nginx /etc/apparmor.d/docker-nginx
