#!/bin/bash
sudo yum update -y
sudo yum install ansible --enablerepo=epel -y
echo "localhost ansible_connection=local" | sudo tee -a /etc/ansible/hosts
cat <<EOT > build_all.yaml
---
- hosts: all
  tasks:
    - name: Installs vault
      unarchive: src=https://releases.hashicorp.com/vault/0.6.4/vault_0.6.4_linux_amd64.zip  dest=/usr/local/bin remote_src=True
      become: true

    - name: install jq
      yum:
        name: jq
        state: latest
      become: true

    - name: install Development Tools
      yum:
        name: "@Development Tools"
        state: latest
        update_cache: yes
      become: true

    - name: get envconsole
      unarchive:
        src: https://releases.hashicorp.com/envconsul/0.6.2/envconsul_0.6.2_linux_amd64.tgz
        dest: /usr/local/bin
        remote_src: True
      become: true

    - name: Installs console
      unarchive: src=https://releases.hashicorp.com/consul/0.7.2/consul_0.7.2_linux_amd64.zip  dest=/usr/local/bin remote_src=True
      become: true

EOT

cat <<EOT > example.hcl
backend "consul" {
  address = "127.0.0.1:8500"
  path = "vault"
}

listener "tcp" {
 address = "127.0.0.1:8200"
 tls_disable = 1
}
disable_mlock = true
EOT

cat <<EOT > start_consul.sh
#!/bin/bash
consul agent -server -bootstrap-expect 1 -data-dir /tmp/consul
EOT

cat <<EOT > start_vault.sh
#!/bin/bash
vault server -config=example.hcl
EOT

chmod +x *.sh

ansible-playbook build_all.yaml

: '
 process from scratch is to
 export VAULT_ADDR=http://127.0.0.1:8200
 1. start consul (start_consul.sh)
 2. start vault  (start_vault.sh)
 3. init vault (vault init)
 4. vault unseal

 for envconsul setup (https://github.com/hashicorp/envconsul)
 for consul setup


'
