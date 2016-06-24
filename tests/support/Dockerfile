FROM debian:jessie

RUN apt-get -y update
RUN apt-get -y install --fix-missing
RUN DEBIAN_FRONTEND=noninteractive \
    apt-get install -y             \
      gcc libffi-dev libssl-dev    \
      python python-dev            \
      python-yaml python-pip
RUN apt-get -y --purge remove \
      python-cffi

RUN pip install --upgrade cffi
RUN pip install ansible

RUN apt-get -f -y --auto-remove remove \
    gcc libffi-dev libssl-dev          \
    python-pip python-dev 
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/*

COPY run-tests.sh run-tests.sh
CMD ["./run-tests.sh"]
