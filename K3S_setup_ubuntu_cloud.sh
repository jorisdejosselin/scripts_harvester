echo "alias k=kubectl" >> /etc/bash.bashrc
chown ubuntu: /etc/rancher/k3s/k3s.yaml
snap install helm --classic

# Set env variables
export KUBECONFIG="/etc/rancher/k3s/k3s.yaml" ; echo "export KUBECONFIG="/etc/rancher/k3s/k3s.yaml"" >> /etc/bash.bashrc

# Install cert-manager
kubectl apply -f https://github.com/jetstack/cert-manager/releases/download/v1.5.1/cert-manager.crds.yaml
helm repo add jetstack https://charts.jetstack.io
helm repo update
helm install cert-manager jetstack/cert-manager --namespace cert-manager --create-namespace --version v1.5.1

# install rancher
helm repo add rancher-latest https://releases.rancher.com/server-charts/latest
kubectl create namespace cattle-system
helm install rancher rancher-latest/rancher --namespace cattle-system --set hostname=rancher.my.org --set replicas=2

