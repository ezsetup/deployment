FROM debian:jessie


COPY Caddyfile /etc/Caddyfile


RUN apt-get update -y && apt-get install -y ca-certificates curl

RUN curl --silent --show-error --fail --location \
    --header "Accept: application/tar+gzip, application/x-gzip, application/octet-stream" \
    -o - "https://caddyserver.com/download/linux/amd64" \
    | tar --no-same-owner -C /usr/bin/ -xz caddy \
    && chmod 0755 /usr/bin/caddy


VOLUME /root/.caddy

EXPOSE 80 443
ENTRYPOINT ["/usr/bin/caddy"]
CMD ["--conf", "/etc/Caddyfile", "--log", "stdout"]
