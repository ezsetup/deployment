FROM debian:jessie


COPY Caddyfile /etc/Caddyfile

COPY dist/ /var/www/html/dist/

RUN apt-get update -y && apt-get install -y ca-certificates

COPY bin/caddy /usr/bin/
RUN chmod 0755 /usr/bin/caddy


VOLUME /root/.caddy

EXPOSE 80 443
ENTRYPOINT ["/usr/bin/caddy"]
CMD ["--conf", "/etc/Caddyfile", "--log", "stdout"]