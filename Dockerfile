#FROM dhollerbach/ubuntu:msteams
FROM rfuehrer/alpine-python-mini

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
