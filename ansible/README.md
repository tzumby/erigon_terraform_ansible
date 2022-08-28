# How to use this

## First install the galaxy collections

```
ansible-galaxy collection install devsec.hardening
ansible-galaxy collection install fahcsim.grafana_stack
```

Make sure everything is there:

```
ansible-galaxy collection list
```

## Copy your public key and generate a hashed password for your user

```
openssl passwd -salt random_salt -1 password
```

## Run it

```
ansible-playbook -i production bastion.yml -u ubuntu --private-key ~/.ssh/key.cer
```

## Configure ssh

~/.ssh/config

```
Host bastion_ip
  User ubuntu
  IdentityFile ~/.ssh/key.cer

Host private_ip
  User ubuntu
  Hostname private_ip
  Port 22
  IdentityFile ~/.ssh/key.cer
  ProxyCommand ssh -A -q -W %h:%p bastion_ip
```
