#!/bin/bash

# Carrega as constantes de configuração 
set -e
set -x

# Obrigatorios
# Instala suporte a HTTPS para o APT.
# Instala o software-properties-common este cara gerencia de forma organizada repositórios e chaves se for instalar SSH é necessário
# runit gerenciamento e controle de serviços simplificado
# psmisc para permitir o gerenciamento do kill por arvore de processos
apt-get install -y --no-install-recommends apt-transport-https ca-certificates software-properties-common runit psmisc

# Opcionais
# curl para permitir donwloads via http
# tar para permitir descompactar arquivos
# nano editor de texto
# lsof verificador de portas e conexões de rede
apt-get install -y --no-install-recommends curl tar nano lsof

## script simplifica o apt para instalar pacotes de forma limpa
cp /docker_build/bin/apt_install_clean /sbin/apt_install_clean
