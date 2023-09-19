FROM alpine:latest

RUN apk add --no-cache aws-cli curl
# This needs the community repo enabled
# RUN apk add --no-cache kubectl

RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
RUN chmod +x ./kubectl
RUN mv ./kubectl /usr/bin/kubectl

WORKDIR /app
COPY ./entrypoint.sh /app/entrypoint.sh

ENTRYPOINT ["/app/entrypoint.sh"]
