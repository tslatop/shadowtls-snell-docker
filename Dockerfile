FROM --platform=$BUILDPLATFORM frolvlad/alpine-glibc:latest

ARG TARGETPLATFORM
ARG VERSION

RUN wget -q -O "snell-server.zip" https://dl.nssurge.com/snell/snell-server-v4.0.1-linux-aarch64.zip && \
    unzip snell-server.zip && rm snell-server.zip

FROM frolvlad/alpine-glibc:latest

ENV TZ=UTC

COPY --from=build /snell-server /usr/bin/snell-server
COPY start.sh /start.sh
RUN apk add --update --no-cache libstdc++

ENTRYPOINT /start.sh
