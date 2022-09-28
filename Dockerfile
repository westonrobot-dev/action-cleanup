FROM alpine:3.16.2

RUN apk update && apk add bash && rm -rf /var/cache/apk/*
# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

RUN addgroup -g 1000 actions
RUN adduser -u 1000 -G actions -h /home/actions -D actions

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]