FROM golang:1.17

ADD . /prj

ENTRYPOINT ["/prj/entrypoint.sh"]
