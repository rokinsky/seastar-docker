FROM fedora:31
MAINTAINER Aleksander Sorokin <ankezy@gmail.com>

# https://github.com/scylladb/seastar/
COPY install-dependencies.sh .

RUN ./install-dependencies.sh && \
 dnf install -y git clang rsync vim \
 strace valgrind gdb gdb-gdbserver openssh-server

WORKDIR /seastar

RUN git clone -b zpp_fs --single-branch https://github.com/rokinsky/seastar . && \
 ./configure.py --mode=dev --prefix=/usr/local && \
 ninja -j1 -C build/dev install

RUN mkdir /var/run/sshd && /usr/bin/ssh-keygen -A && \
 echo 'root:root' | chpasswd && \
 sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
 sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

# 22 for ssh server. 7777 for gdb server.
EXPOSE 22 7777

RUN groupadd -r scylla && \
 useradd -ms /bin/bash -r -g scylla scylla && \
 echo 'scylla:dev' | chpasswd

CMD ["/usr/sbin/sshd", "-D"]
