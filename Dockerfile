FROM debian:stretch-slim
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get --no-install-recommends install -y \
        texlive-base \
        texlive-latex-base \
        texlive-luatex \
        wget \
        xzdec && \
    rm -rf /var/lib/apt/lists/*

ENV TEXMFHOME=/usr/local/share/texmf/ \
    TEXMFVAR=/var/tmp/texmf-var/ \
    TEXMFCONFIG=/var/tmp/texmf-config/

RUN tlmgr init-usertree 

WORKDIR /data
VOLUME ["/data"]
