#!/bin/bash

mkdir -p $GOPATH/src
mkdir -p $GOPATH/src/k8s.io

cd $GOPATH/src/k8s.io
git clone https://github.com/Sharpz7/kubernetes.git
cd $GOPATH/src/k8s.io/kubernetes

sudo apt install -y build-essential net-tools jq
pip3 install pyyaml && python3 -c "import yaml; print(yaml.__version__)"
./hack/install-etcd.sh
