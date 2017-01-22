FROM ubuntu:16.04

MAINTAINER mstrpupt2

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y wget

# Install and move to correct dir
RUN wget https://releases.mattermost.com/3.6.1/mattermost-3.6.1-linux-amd64.tar.gz
RUN tar -xvzf mattermost*.gz
    
# Copy in config
COPY config.json /

# Copy in startup script
COPY start.sh /
RUN chmod +x /start.sh
ENTRYPOINT ["/start.sh"]

EXPOSE 80
