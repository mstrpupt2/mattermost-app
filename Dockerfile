FROM ubuntu:16.04

MAINTAINER mstrpupt2

# Update and add packages
RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y wget

# Create Data Dir
RUN mkdir -p /mattermost/data

# Install and move to correct dir
RUN wget https://releases.mattermost.com/3.6.1/mattermost-3.6.1-linux-amd64.tar.gz
RUN tar -xvz mattermost*.gz

# Remove old config
RUN rm /mattermost/config/config.json
    
# Copy in config
COPY config.json /

# Copy in startup script
COPY start.sh /
RUN chmod +x /start.sh
ENTRYPOINT ["/start.sh"]

EXPOSE 80
