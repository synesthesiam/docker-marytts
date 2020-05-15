FROM openjdk:8-jre as base-amd64

FROM arm32v7/openjdk:8-jre as base-armv7

FROM arm64v8/openjdk:8-jre as base-arm64

FROM balenalib/raspberry-pi-openjdk:8-stretch-run as base-armv6

# -----------------------------------------------------------------------------

ARG TARGETARCH
ARG TARGETVARIANT
FROM base-$TARGETARCH$TARGETVARIANT

ENV MARY_BASE=/marytts

COPY lib/ ${MARY_BASE}/lib/
COPY jar/ ${MARY_BASE}/jar/
COPY voices/* ${MARY_BASE}/lib/
COPY bin/ ${MARY_BASE}/bin/

WORKDIR ${MARY_BASE}

EXPOSE 15195

ENTRYPOINT ["bash", "/marytts/bin/marytts-server"]