FROM debian:10-slim
LABEL maintainer "Marco De Donno <Marco.DeDonno@unil.ch>"

################################################################################
#    System update

RUN apt-get update && \
    apt-get install -y curl python python-pip git && \
    rm -rf /var/lib/apt/lists/*

################################################################################
#    Side libraries installation

COPY ./library /library

RUN find /library -name 'requirements.txt' -exec pip install -r {} \; && \
    rm -rf /root/.cache/*
RUN find /library -maxdepth 1 -mindepth 1 > /usr/local/lib/python2.7/dist-packages/mdedonno.pth

RUN chmod +x /library/WSQ/WSQ/NBIS/cwsq && \
    chmod +x /library/WSQ/WSQ/NBIS/dwsq

RUN find /library -name 'doctester.py' -execdir python {} \;

