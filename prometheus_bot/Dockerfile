FROM golang:alpine
RUN apk add git --no-cache &&\
  go get github.com/inCaller/prometheus_bot &&\
  go install github.com/inCaller/prometheus_bot &&\
  apk del git --no-cache &&\
  rm -rf /go/src/*
EXPOSE 9087
ENTRYPOINT ["/go/bin/prometheus_bot"]
CMD ["--help"]
