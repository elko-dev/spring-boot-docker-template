
FROM alpine:3.11.5

RUN apk add --no-cache openjdk8-jre nss
RUN apk add --no-cache curl
RUN apk add --no-cache jq

RUN mkdir -p /tools
COPY health-check.sh /tools

RUN chmod +X /tools/health-check.sh

RUN mkdir -p /app /tmp/unzip
COPY elko-spawn.zip /tmp/app.zip
RUN unzip /tmp/app.zip -d /tmp/unzip && cp -rf /tmp/unzip/*/* /app

CMD ["/app/bin/elko-spawn"]
HEALTHCHECK --interval=2s CMD /tools/health-check.sh

EXPOSE 8080