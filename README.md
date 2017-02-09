# ubuntu-sshd
Dockerized Ubuntu SSH service
$ docker build --no-cache t ubuntu-sshd .

#Public key authentication
$ docker run -d -e AUTHORIZED_KEY="`cat ~/.ssh/id_rsa.pub`" -P ubuntu-sshd
#My Public key authentication
$ sudo docker run -d -e AUTHORIZED_KEY="ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAinL3rFGOl9WwXEgFsIGWpPU10N7UeHf4NMgCm2Qaz5jx323Mf/s1O4FrvkirSerdkWo4a+8R+lIRVqCHpnsVSrzxzlNim2+uKr57T8jDDmNcGT7lO4URWtL4bsBCFEQx1ZpaeCY+ilyIorc6bVDog4EEOuLJPsQWlcEJ7aW8cFw3Q6+7ogbnvo2rz9wRvWn05VBG0itmE1D+gXwgWGNzgLMqWnTpcdwFmS4RJamT79pQcIKhqzwdUszBCPt9/MXXjyZytq1mjFJp9reNx1V3ms+D7WbRUIBuiJ/Bm1uL/7X1tU0Q1GJdNGzPJ8jFcb/+uzNbzWq3JwXA0jL69k1qOw==" -P ubuntu-sshd
#username/password
$ docker run -d -e ROOT_PWD="admin" -P ubuntu-sshd

