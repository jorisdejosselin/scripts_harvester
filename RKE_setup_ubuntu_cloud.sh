curl -sfL https://get.rke2.io | sh -
systemctl enable --now rke2-server
echo "export PATH="/var/lib/rancher/rke2/bin:$PATH"" >> bash.bashrc
