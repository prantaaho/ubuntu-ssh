# Ubuntu SSHd

Dockerized SSH service, built on top of official Ubuntu 14.04 images. Uses key authentication. 

## SSH-key

Before building the image create your own ssh-key and copy the public key to same directory where Dockerfile resides.

```bash
ssh-keygen -f docker_ssh.rsa -t rsa
mv docker_ssh.rsa.pub ubuntu-ssh/
```

## Config:

  - `PermitRootLogin yes`
  - exposed port 22
  - default command: `/usr/sbin/sshd -D`
  - root password: `root`

## Run example

```bash
$ sudo docker run -d -P --name test_sshd ubuntu-ssh
$ sudo docker port test_sshd 22
  0.0.0.0:49154
$ ssh-add docker_ssh.rsa
$ ssh root@localhost -p 49154
root@test_sshd $
```

