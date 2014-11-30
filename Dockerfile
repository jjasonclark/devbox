FROM buildpack-deps:jessie
MAINTAINER "Jason Clark <jason@jjcconsultingllc.com>"

# Base
RUN apt-get -y update && apt-get -y install curl procps tmux ctags

ENV RUBY_MAJOR 2.1
ENV RUBY_VERSION 2.1.5
ENV GEM_HOME /usr/local/bundle
ENV PATH $GEM_HOME/bin:$PATH
ENV BUNDLE_APP_CONFIG $GEM_HOME

COPY ./build /build
RUN chmod +x /build/*.sh

RUN /build/python.sh
RUN /build/ruby.sh
RUN /build/git.sh
RUN /build/vim.sh

