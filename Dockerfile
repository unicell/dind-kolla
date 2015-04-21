FROM jpetazzo/dind:latest
MAINTAINER Qiu Yu <unicell@gmail.com>

ENV LOG file

RUN apt-get update -q
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

# fix: `stdin: is not a tty` message
RUN sed -i 's/^mesg n$/tty -s \&\& mesg n/g' /root/.profile
RUN apt-get install -y gawk build-essential
