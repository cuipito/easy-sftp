FROM alpine:3.7

LABEL maintainer="cuipito (@cuipito)"

COPY sshd_config /etc/ssh/sshd_config
COPY server /


RUN set -x \
&&  apk add --no-cache --update openssh bash \
&&  mkdir -p /var/run/sshd \
&& chmod +x /server

COPY hostkeys/ /etc/ssh/host_keys/.

CMD ["/server"]
