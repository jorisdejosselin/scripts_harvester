curl -sfL https://get.k3s.io | sh -
echo "alias k=kubectl" >> /etc/bash.bashrc
chown ubuntu: /etc/rancher/k3s/k3s.yaml
snap install helm --classic

# install rancher
helm repo add rancher-latest https://releases.rancher.com/server-charts/latest
kubectl create namespace cattle-system
helm install rancher rancher-latest/rancher --namespace cattle-system --set hostname=rancher.my.org --set replicas=2

