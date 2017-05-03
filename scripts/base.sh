#! /bin/bash
# Install base dependencies
apt-get update
apt-get install -y -q --no-install-recommends \
  git \
  ca-certificates \
  curl
rm -rf /var/lib/apt/lists/*
