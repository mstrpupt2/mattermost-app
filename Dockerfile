FROM ubuntu:16.04

MAINTAINER mstrpupt2

RUN apt-get update -y

# Install and move to correct dir
RUN curl https://releases.mattermost.com/3.6.1/mattermost-3.6.1-linux-amd64.tar.gz && \
    tar -xvzf mattermost*.gz && \
    mv mattermost /opt && \
    mkdir /opt/mattermost/data
    
# Copy in config
# COPY config.json /opt/mattermost/config/

#CMD ['start.sh']
