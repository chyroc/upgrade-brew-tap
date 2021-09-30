FROM golang:1.17

COPY LICENSE README.md /

RUN ls -alh

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
