FROM golang:1.12-rc-alpine3.9 AS build

ENV GOPROXY https://goproxy.io
ENV GO111MODULE on
WORKDIR /go/src/github.com/gohugoio

RUN \
  apk add --no-cache \
  git \
  musl-dev && \
  git clone https://github.com/gohugoio/hugo.git && \
  cd hugo && git checkout -b v0.58.3 v0.58.3 && \
  CGO_ENABLED=0 go install -ldflags '-s -w'

FROM alpine:3.12
COPY --from=build /go/bin/hugo /hugo

EXPOSE  1313

ENTRYPOINT [ "/hugo" ]
CMD [ "--help" ]
