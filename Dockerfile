ARG VERSION=latest
FROM rust:$VERSION

MAINTAINER cloudqq <cloudqq@gmail.com>

# Fix "Couldn't register with accessibility bus" error message
ENV NO_AT_BRIDGE=1

ENV DEBIAN_FRONTEND noninteractive

RUN sed --in-place --regexp-extended "s/archive\.ubuntu/azure\.archive\.ubuntu/g" /etc/apt/sources.list \
  && echo 'APT::Get::Assume-Yes "true";' >> /etc/apt/apt.conf \
  &&  echo 'APT::Get::Install-Recommends "false";' >> /etc/apt/apt.conf \
  && echo 'APT::Get::Install-Suggests "false";' >> /etc/apt/apt.conf \
  && apt-get update && apt-get install gdb
RUN apt-get install gdbserver

CMD ["bash"]
