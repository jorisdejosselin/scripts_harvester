# Kubectl tweaks
kubectl completion bash | sudo tee /etc/bash_completion.d/kubectl > /dev/null
echo "alias k=kubectl" >> /etc/bash.bashrc
echo 'alias x="kubectx"' >> /etc/bash.bashrc
echo 'alias e="kubens"' >> /etc/bash.bashrc
echo 'complete -F __start_kubectl k' >> /etc/bash.bashrc
chown -R ubuntu: /etc/rancher/k3s/

# Install kubectx en kubens
git clone https://github.com/ahmetb/kubectx /opt/kubectx
install -o root -g root -m 0755 /opt/kubectx/kubectx /usr/local/bin/kubectx
install -o root -g root -m 0755 /opt/kubectx/kubens /usr/local/bin/kubens

# install helm CLI
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
helm install rancher rancher-latest/rancher --namespace cattle-system --set hostname=rancher.joict.nl --set replicas=2

