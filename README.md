# docker-lualatex
![GitHub](https://img.shields.io/github/license/brokenpylons/docker-lualatex.svg)
[![Build Status](https://travis-ci.org/brokenpylons/docker-lualatex.svg?branch=master)](https://travis-ci.org/brokenpylons/docker-lualatex)
![Docker Pulls](https://img.shields.io/docker/pulls/brokenpylons/lualatex.svg)

Minimal-ish base image for running lualatex.

[dockerhub](https://hub.docker.com/r/brokenpylons/lualatex)

## Why?

All other images on dockerhub are bloated. This image installs only the minimal selection of packages needed to run lualatex and nothing more.

Based on:
- debian:stretch-slim

Included:

- texlive-base
- texlive-latex-recommended
- texlive-luatex

The size on dockerhub is 116MB (316MB when installed).

## Usage

```
docker run --rm -i --user="$(id -u):$(id -g)" --net=none -v "$PWD:/data" brokenpylons/lualatex lualatex
```

## See also:
* [docker-lualatex-build](https://github.com/brokenpylons/docker-lualatex-build)
* [A short postmortem on moving to Docker for LaTeX continuous integration](https://ljvmiranda921.github.io/notebook/2018/04/23/postmortem-shift-to-docker/)
* [blang/latex-docker](https://github.com/blang/latex-docker)
