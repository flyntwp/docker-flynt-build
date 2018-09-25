FROM ubuntu:16.04

# Set debconf to run non-interactively
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

# make the "en_US.UTF-8" locale so postgres will be utf-8 enabled by default
RUN apt-get update && apt-get install -y locales && rm -rf /var/lib/apt/lists/* \
	&& localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.utf8

COPY ./scripts/base.sh /build_scripts/base.sh
RUN /build_scripts/base.sh

COPY ./scripts/php7.2.sh /build_scripts/php7.2.sh
RUN /build_scripts/php7.2.sh

COPY ./scripts/composer.sh /build_scripts/composer.sh
RUN /build_scripts/composer.sh

COPY ./scripts/node8.sh /build_scripts/node8.sh
RUN /build_scripts/node8.sh

COPY ./scripts/yarn.sh /build_scripts/yarn.sh
RUN /build_scripts/yarn.sh

COPY ./scripts/deps.sh /build_scripts/deps.sh
RUN /build_scripts/deps.sh
