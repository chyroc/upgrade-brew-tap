FROM golang:1.17

ADD . /prj

RUN ls -alh

RUN ls -alh /prj

ENTRYPOINT ["/prj/entrypoint.sh"]
