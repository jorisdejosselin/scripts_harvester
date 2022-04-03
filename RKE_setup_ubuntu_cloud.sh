curl -sfL https://get.rke2.io | sh -
systemctl enable --now rke2-server
echo "export PATH="/var/lib/rancher/rke2/bin:$PATH"" >> /etc/bash.bashrc
mkdir -p /home/ubuntu/.kube/
cp /etc/rancher/rke2/rke2.yaml /home/ubuntu/.kube/config
chown ubuntu: /home/ubuntu/.kube/config
