FROM ubuntu:14.04
MAINTAINER Perttu Ranta-aho <perttu.ranta-aho@bittituki.com>

# update
RUN apt-get update && apt-get -y upgrade

# Locale
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y locales
RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen && locale-gen && echo 'LANG="en_US.UTF-8"' > /etc/default/locale

# ssh
ADD docker_ssh.rsa.pub /root/.ssh/authorized_keys
RUN chmod 700 /root/.ssh && chmod 600 /root/.ssh/authorized_keys
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y zip unzip openssh-server openssh-blacklist-extra openssl openssl-blacklist
RUN mkdir /var/run/sshd
RUN sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]

