#!/bin/bash
set -e
set -x

apt-get clean
find /docker_build/ -not \( \
-name 'docker_build' -or \
-name 'constantes' -or \
-name 'limpeza.sh' -or \
-name 'app' -or \
-path '/docker_build/app/install.sh' \
\) -delete
rm -rf /tmp/* /var/tmp/*
rm -rf /var/lib/apt/lists/*

# clean up python bytecode
find / -mount -name *.pyc -delete
find / -mount -name *__pycache__* -delete

rm -f /etc/ssh/ssh_host_*
