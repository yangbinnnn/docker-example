# build
FROM golang:1.9.4-alpine3.7 as builder

WORKDIR /root
COPY app.go .
RUN go build -o app app.go

# pack
FROM alpine:3.7

COPY --from=builder /root/app /root
COPY entrypoint.sh /root

RUN apk update \
    && apk add --no-cache bash

WORKDIR /root
ENTRYPOINT [ "./entrypoint.sh" ]