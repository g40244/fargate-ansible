FROM alpine

# run commands for install ansible
RUN apk add --no-cache python2 curl gcc make libffi-dev python2-dev musl-dev openssl-dev && \
    curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
    python get-pip.py && \
    rm -f get-pip.py && \
    pip install ansible awscli && \
    apk del --purge gcc make && \
    rm -rf /root/.cache/pip && \
    adduser -D ansible

USER ansible

# copy files
COPY ./file/ansible.cfg /etc/ansible/ansible.cfg
COPY --chown=ansible:ansible ./file/entry.sh /home/ansible/entry.sh

ENTRYPOINT ["/bin/sh", "/home/ansible/entry.sh"]
