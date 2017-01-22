FROM ubuntu:16.04

MAINTAINER mstrpupt2

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y wget

# Install and move to correct dir
RUN wget https://releases.mattermost.com/3.6.1/mattermost-3.6.1-linux-amd64.tar.gz
RUN tar -xvzf mattermost*.gz && \
    mv mattermost /opt && \
    mkdir /opt/mattermost/data
    
# Copy in config
COPY config.json /opt/mattermost/config/

# Copy in startup script
COPY start.sh /
RUN chmod 755 start.sh

EXPOSE 80

CMD ['./start.sh']
