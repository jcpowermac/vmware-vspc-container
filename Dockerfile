FROM registry.fedoraproject.org/fedora:31

RUN dnf install -y git python3-setuptools python3-pip python3-oslo-log python3-oslo-config python3-pbr && \
    cd /tmp/ && \
    git clone https://opendev.org/x/vmware-vspc.git && \
    cd ./vmware-vspc && \
    python3 setup.py install && \
    mkdir -p /etc/vmware-vspc/ && \
    mkdir -p /var/log/vmware-vspc/

COPY vspc.conf /etc/vmware-vspc/

ENTRYPOINT ["vmware-vspc"]
CMD ["--config-file", "/etc/vmware-vspc/vspc.conf"]
