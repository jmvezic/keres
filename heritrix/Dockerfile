# syntax=docker/dockerfile:1
FROM node:12-alpine
ARG HERITRIX_VERSION
ARG HERITRIX_USER
ARG HERITRIX_PASS
ARG HERITRIX_MAX_MEM
RUN apk add --no-cache sudo bash wget nano openjdk8
RUN wget -q https://repo1.maven.org/maven2/org/archive/heritrix/heritrix/${HERITRIX_VERSION}/heritrix-${HERITRIX_VERSION}-dist.tar.gz
RUN mkdir -p /wct
RUN mv heritrix-${HERITRIX_VERSION}-dist.tar.gz /wct/heritrix-3.4.0-SNAPSHOT-dist.tar.gz && cd /wct && tar -xzf heritrix-3.4.0-SNAPSHOT-dist.tar.gz
ENV JAVA_HOME=/usr/lib/jvm/default-jvm
ENV JAVA_OPTS=-Xmx3000M
COPY ./src/heritrix_start.sh /wct
COPY ./src/amqp-client-3.2.1.jar /wct/heritrix-${HERITRIX_VERSION}/lib
COPY ./src/heritrix-contrib-3.4.0-20210527.jar /wct/heritrix-${HERITRIX_VERSION}/lib
RUN sed -i -e "s|version|${HERITRIX_VERSION}|" /wct/heritrix_start.sh
RUN sed -i -e "s|user|${HERITRIX_USER}|" /wct/heritrix_start.sh
RUN sed -i -e "s|pass|${HERITRIX_PASS}|" /wct/heritrix_start.sh
RUN sed -i -e "s/trixmem/${HERITRIX_MAX_MEM}/g" /wct/heritrix_start.sh
RUN chmod -R 700 /wct
EXPOSE 8443
ENTRYPOINT ["/wct/heritrix_start.sh"]
