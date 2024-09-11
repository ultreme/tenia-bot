# dynamic config
ARG             BUILD_DATE
ARG             VCS_REF
ARG             VERSION

# build
FROM golang:1.23-alpine as builder
RUN             apk add --no-cache git gcc musl-dev make
ENV             GO111MODULE=on
WORKDIR         /go/src/ultre.me/tenia-bot
COPY            go.* ./
RUN             go mod download
COPY            . ./
RUN             make install

# minimalist runtime
FROM alpine:3.20
LABEL           org.label-schema.build-date=$BUILD_DATE \
                org.label-schema.name="tenia-bot" \
                org.label-schema.description="" \
                org.label-schema.url="https://ultre.me/tenia-bot/" \
                org.label-schema.vcs-ref=$VCS_REF \
                org.label-schema.vcs-url="https://github.com/ultreme/tenia-bot" \
                org.label-schema.vendor="Ultreme M1ch3l" \
                org.label-schema.version=$VERSION \
                org.label-schema.schema-version="1.0" \
                org.label-schema.cmd="docker run -i -t --rm ultreme/tenia-bot" \
                org.label-schema.help="docker exec -it $CONTAINER tenia-bot --help"
COPY            --from=builder /go/bin/tenia-bot /bin/
ENTRYPOINT      ["/bin/tenia-bot"]
#CMD             []
