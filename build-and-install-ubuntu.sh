#!/bin/bash

set -e

if [ "$EUID" -ne 0 ]
  then echo "This script must be run as root"
  exit
fi

cd tools
./debian-setup.sh
cd ..

mkdir -p build
cd build
cmake -G Ninja ..
sudo ninja install

sudo setcap cap_net_raw,cap_net_admin+eip /usr/local/bin/dumpcap
