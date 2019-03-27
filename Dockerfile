FROM debian:stretch-slim
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get --no-install-recommends install -y \
        texlive-base \
        texlive-fonts-recommended \
        texlive-latex-recommended \
        texlive-luatex && \
    rm -rf /var/lib/apt/lists/*

#TEXMFCACHE
RUN chmod 1777 /var/lib/texmf

WORKDIR /data
VOLUME ["/data"]
