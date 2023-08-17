sudo apt install net-tools

cd $GOPATH/src/k8s.io
git clone https://github.com/Sharpz7/kubernetes.git
cd $GOPATH/src/k8s.io/kubernetes

./hack/install-etcd.sh
