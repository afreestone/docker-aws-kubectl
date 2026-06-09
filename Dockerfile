# Pinned to a current Alpine release for reproducible builds. The aws-cli it
# ships must be >= 2.15: EKS Pod Identity serves credentials from
# http://169.254.170.23/v1/credentials, and only aws-cli >= 2.15 allows that
# host. Older versions reject it with "Unsupported host '169.254.170.23'".
FROM alpine:3.21

RUN apk add --no-cache aws-cli curl
# This needs the community repo enabled
# RUN apk add --no-cache kubectl

RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
RUN chmod +x ./kubectl
RUN mv ./kubectl /usr/bin/kubectl

WORKDIR /app
COPY ./entrypoint.sh /app/entrypoint.sh

ENTRYPOINT ["/app/entrypoint.sh"]
