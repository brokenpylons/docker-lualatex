FROM debian:stretch-slim as installer
ARG DEBIAN_FRONTEND=noninteractive 

RUN apt-get update && \
    apt-get --no-install-recommends install -y \
        perl-modules \
        liburi-encode-perl \
        gnupg \
        wget && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /install

COPY texlive.profile .

RUN wget -qO- http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz | tar -xzf- --strip-components=1 && \
    ./install-tl -profile texlive.profile

FROM debian:stretch-slim
ARG DEBIAN_FRONTEND=noninteractive

COPY --from=installer /usr/local/texlive /usr/local/texlive

RUN apt-get update && \
    apt-get --no-install-recommends install -y \
        perl-modules \
        liburi-encode-perl \
        gnupg \
        wget && \
    rm -rf /var/lib/apt/lists/*

ENV HOME=/tmp PATH="/usr/local/texlive/bin/x86_64-linux:$PATH"

RUN tlmgr install \
        collection-latex \
        collection-luatex \
        fontspec && \
    rm -rf /usr/local/texlive/texmf-var/*

WORKDIR /data
VOLUME ["/data"]
