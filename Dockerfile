# vim:set ft=dockerfile:
FROM ubuntu:latest

RUN apt-get update && apt-get install -y locales curl && rm -rf /var/lib/apt/lists/* \
	&& localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.utf8

ENV DIR /usr/src/Free-RDP

COPY kali.sh $DIR/
RUN chmod +x $DIR/kali.sh
RUN bash $DIR/kali.sh

COPY . $DIR
