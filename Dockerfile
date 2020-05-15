FROM openjdk:8-jre

ENV MARY_BASE=/marytts

COPY lib/ ${MARY_BASE}/lib/
COPY jar/ ${MARY_BASE}/jar/
COPY voices/* ${MARY_BASE}/lib/
COPY bin/ ${MARY_BASE}/bin/

WORKDIR ${MARY_BASE}

EXPOSE 15195

ENTRYPOINT ["bash", "/marytts/bin/marytts-server"]