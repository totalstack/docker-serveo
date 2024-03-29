FROM debian:jessie

RUN apt-get update && apt-get install -y \
  openssh-client \
&& rm -rf /var/lib/apt/lists/*

ENV LOCAL_HOST 0.0.0.0
ENV LOCAL_PORT 443
ENV REMOTE_PORT 4443
ENV REMOTE_HOST devnet

# https://serveo.net/
# ssh -R incubo:80:localhost:8888 serveo.net
CMD ["sh", "-c", "ssh -o ServerAliveInterval=60 -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null -R $REMOTE_HOST:$REMOTE_PORT:$LOCAL_HOST:$LOCAL_PORT serveo.net"]

