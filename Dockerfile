#FROM quay.io/bashell/alpine-python:3
FROM docker.io/jamiehewland/alpine-pypy:3.6

RUN apk update \
 && apk upgrade \
 && apk add openssl libffi \
 && apk add openssl-dev libffi-dev musl-dev gcc make \
 && pip3.6 install --compile --upgrade pip \
 && pip3.6 install --compile --upgrade setuptools \
 && pip3.6 install --compile "tornado<6.0.0" \
 && pip3.6 install --compile webssh \
 && apk del openssl-dev libffi-dev musl-dev gcc make \
 && rm -rf /var/cache/*/*

ADD run.sh /

EXPOSE 8888/tcp

CMD ["/run.sh"]

