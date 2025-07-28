#!/bin/bash
# libs necessárias para o FB
apt-get install -y --no-install-recommends libicu74

apt-get install -y --no-install-recommends libncurses6 

apt-get install -y --no-install-recommends libtommath1

# links para bibliotecas devido a troca de versão
ln -s /usr/lib/x86_64-linux-gnu/libtommath.so.1 /usr/lib/x86_64-linux-gnu/libtommath.so.0
ln -s /usr/lib/x86_64-linux-gnu/libncurses.so.6 /usr/lib/x86_64-linux-gnu/libncurses.so.5


mkdir -p /opt/rinha
mkdir -p /opt/rinha/Logs

cp /docker_build/app/Rinha /opt/rinha/Rinha
rm -f /docker_build/app/Rinha

cp /docker_build/app/libfbclient.so /opt/rinha/libfbclient.so
#cp /docker_build/app/libfbclient.so.2 /opt/rinha/libfbclient.so.2
#cp /docker_build/app/libfbclient.so.5.0.3 /opt/rinha/libfbclient.so.5.0.3
rm -f /docker_build/app/libfbclient.so
#rm -f /docker_build/app/libfbclient.so.2
#rm -f /docker_build/app/libfbclient.so.5.0.3

cp /docker_build/app/app.init /etc/my_init.d/20_app.init
rm -f /docker_build/app/app.init

cp /docker_build/app/app.shutdown /etc/my_init.pre_shutdown.d/20_app.shutdown
rm -f /docker_build/app/app.shutdown

exit 0

