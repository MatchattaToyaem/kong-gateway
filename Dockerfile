FROM kong:3.7

USER root
RUN apt-get update && apt-get install -y gettext-base && rm -rf /var/lib/apt/lists/*

COPY kong.yaml.template /etc/kong/kong.yaml.template
COPY entrypoint.sh /kong-entrypoint.sh
RUN chmod +x /kong-entrypoint.sh

USER kong
ENTRYPOINT ["/kong-entrypoint.sh"]
CMD ["kong", "docker-start"]
