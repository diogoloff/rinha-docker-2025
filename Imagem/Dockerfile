FROM ubuntu:24.04

ENV LC_ALL=C
ENV DEBIAN_FRONTEND=noninteractive

ENV SERVICES_INIT_DIRECTORY=/etc/my_init.d
ENV SERVICES_STOP_DIRECTORY=/etc/my_init.pre_shutdown.d

COPY . /docker_build

RUN /docker_build/base.sh && \
	/docker_build/ferramentas.sh && \
	/docker_build/servicos.sh && \
	/docker_build/app/install.sh && \
    /docker_build/limpeza.sh

ENV DEBIAN_FRONTEND="teletype"
