FROM       ubuntu:16.04
MAINTAINER dreambox "https://github.com/gitdreambox"
#https://github.com/arukasio/docker-hub-images/tree/master/quickstart-ubuntu
#https://github.com/soulfeng/sshd_ubuntu
#https://github.com/rastasheep/ubuntu-sshd

# Set username/password login as a default
# public authentication will be enabled with AUTHORIZED_KEY ENV
ENV ROOT_PWD default
ENV AUTHORIZED_KEY none

# update aliyun sources
#RUN echo "deb http://mirrors.aliyun.com/ubuntu/ xenial main restricted universe multiverse" > /etc/apt/sources.list
#RUN echo "deb http://mirrors.aliyun.com/ubuntu/ xenial-security main restricted universe multiverse" >> /etc/apt/sources.list
#RUN echo "deb http://mirrors.aliyun.com/ubuntu/ xenial-updates main restricted universe multiverse" >> /etc/apt/sources.list
#RUN echo "deb http://mirrors.aliyun.com/ubuntu/ xenial-proposed main restricted universe multiverse" >> /etc/apt/sources.list
#RUN echo "deb http://mirrors.aliyun.com/ubuntu/ xenial-backports main restricted universe multiverse" >> /etc/apt/sources.list
#RUN echo "deb-src http://mirrors.aliyun.com/ubuntu/ xenial main restricted universe multiverse" > /etc/apt/sources.list
#RUN echo "deb-src http://mirrors.aliyun.com/ubuntu/ xenial-security main restricted universe multiverse" >> /etc/apt/sources.list
#RUN echo "deb-src http://mirrors.aliyun.com/ubuntu/ xenial-updates main restricted universe multiverse" >> /etc/apt/sources.list
#RUN echo "deb-src http://mirrors.aliyun.com/ubuntu/ xenial-proposed main restricted universe multiverse" >> /etc/apt/sources.list
#RUN echo "deb-src http://mirrors.aliyun.com/ubuntu/ xenial-backports main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial main restricted" > /etc/apt/sources.list
RUN echo "deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-updates main restricted" > /etc/apt/sources.list
RUN echo "deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial universe" > /etc/apt/sources.list
RUN echo "deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-updates universe" > /etc/apt/sources.list
RUN echo "deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial multiverse" > /etc/apt/sources.list
RUN echo "deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-updates multiverse" > /etc/apt/sources.list
RUN echo "deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-backports main restricted universe multiverse" > /etc/apt/sources.list
RUN echo "deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-security main restricted" > /etc/apt/sources.list
RUN echo "deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-security universe" > /etc/apt/sources.list
RUN echo "deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-security multiverse" > /etc/apt/sources.list

# Install openssh-server
RUN apt-get update
RUN apt-get install -y openssh-server
RUN mkdir -p /var/run/sshd

# Configure sshd.conf
## For username/password login
RUN sed -i "s/PermitRootLogin.*/PermitRootLogin yes/g" /etc/ssh/sshd_config

# Expose 22 for SSH access
EXPOSE 22

COPY start.sh /start.sh
CMD ["./start.sh", "-bash"]
#sudo docker build -t dreambox/ubuntu-sshd github.com/gitdreambox/ubuntu-sshd

