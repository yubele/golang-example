# define ubuntu version, you can use --build-arg
ARG ubuntu_version="19.10"
FROM ubuntu:${ubuntu_version}

# golang version
ARG golang_version="go1.13.7"

# Init shell
SHELL ["/bin/bash", "-c"]

# Nessesary packages
RUN apt update && \
  apt install -y curl bash git binutils bison gcc make mysql-client

# Install golang
RUN bash <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer) && \
  . /root/.gvm/scripts/gvm && \
  gvm install go1.4 -B && \
  gvm use go1.4 && \
  export GOROOT_BOOTSTRAP=$GOROOT && \
  gvm install ${golang_version} && \
  gvm use ${golang_version} --default

# remove the files
RUN apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 3000