# @package    Dockerrized version of Signal K server
# @copyright  2017 (c) Fabian Tollenaar & Signal K, all rights reserved. Distributed under the terms of MIT license
# @author     Fabian Tollenaar <fabian@signalk.org>

FROM ubuntu
MAINTAINER Fabian Tollenaar <fabian@signalk.org>

# Install Node.js and other dependencies
RUN apt-get update && \
    apt-get -y install curl wget unzip xsltproc psmisc can-utils && \
    curl -sL https://deb.nodesource.com/setup_6.x | bash - && \
    apt-get -y install python build-essential nodejs git && \ 
    mkdir -p /opt/app

# Define working directory
WORKDIR /opt/app
RUN cd /opt/app && git clone https://github.com/SignalK/signalk-server-node.git signalk-server
RUN cd /opt/app/signalk-server && npm install

ADD ./data/defaults.json /opt/app/signalk-server/settings
ADD ./data/bootstrap.sh /opt/app
RUN chmod +x /opt/app/bootstrap.sh
EXPOSE 3000
ENTRYPOINT ["/opt/app/bootstrap.sh"]