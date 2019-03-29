FROM debian:stretch-slim
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get --no-install-recommends install -y \
        texlive-base \
        texlive-latex-recommended \
        texlive-luatex && \
    rm -rf /var/lib/apt/lists/*

ENV TEXMFCACHE /tmp/texmf/

WORKDIR /data
VOLUME ["/data"]
