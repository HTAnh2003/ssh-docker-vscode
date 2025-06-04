FROM ubuntu:20.04
WORKDIR /app
# Cài SSH
RUN apt update -y && \
    apt install -y openssh-server && \
    mkdir /var/run/sshd && \
    echo 'root:tienanh123' | chpasswd && \
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
