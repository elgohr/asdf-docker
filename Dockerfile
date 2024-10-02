FROM ubuntu:24.10
LABEL maintainer="larsgohr@posteo.de"

RUN apt-get update && apt-get install -y \
  ca-certificates git curl \
  automake autoconf libreadline-dev \
  libncurses-dev libssl-dev libyaml-dev \
  libxslt-dev libffi-dev libtool unixodbc-dev \
  unzip \
	--no-install-recommends \
	&& rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/asdf-vm/asdf.git /asdf/.asdf \
  && cd /asdf/.asdf \
  && git checkout "$(git describe --abbrev=0 --tags)"
