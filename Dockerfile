FROM alpine:3.6

ENV \
  TERM=xterm \
  AUTOSSH_LOGFILE=/dev/stdout \
  AUTOSSH_GATETIME=30         \
  AUTOSSH_POLL=10             \
  AUTOSSH_FIRST_POLL=30       \
  AUTOSSH_LOGFILE=1

ADD entrypoint.sh /entrypoint.sh

RUN set -ex; \
  chmod 755 /entrypoint.sh; \
  apk add --update --no-cache autossh curl ca-certificates; \
  rm -rf /var/lib/apt/lists/*;

ENTRYPOINT [ "/entrypoint.sh" ]
