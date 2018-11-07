
$master_ip=$1
sysctl net.bridge.bridge-nf-call-iptables=1
kubeadm init --apiserver-advertise-address $master_ip --pod-network-cidr 10.1.0.0/16
sudo cp /etc/kubernetes/admin.conf $HOME/
sudo chown $(id -u):$(id -g) $HOME/admin.conf
export KUBECONFIG=$HOME/admin.conf
kubectl apply -f kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version | base64 | tr -d '\n')"

