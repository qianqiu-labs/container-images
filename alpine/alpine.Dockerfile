FROM alpine:3.12.3

RUN addgroup -g 1000 -S c7n; \
    adduser -G c7n -H -S -u 1000 c7n;