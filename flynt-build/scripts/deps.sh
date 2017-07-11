#! /bin/bash
# dependencies
apt-get update
apt-get install -y -q --no-install-recommends \
  libcairo2-dev \
  libjpeg8-dev \
  libpango1.0-dev \
  libgif-dev \
  build-essential \
  g++ \
  graphicsmagick \
  imagemagick \
  openssh-client \
  unzip
rm -rf /var/lib/apt/lists/*
