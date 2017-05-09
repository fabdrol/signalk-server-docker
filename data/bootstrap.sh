#!/bin/sh

# @package    Dockerrized version of Signal K server
# @copyright  2017 (c) Fabian Tollenaar & Signal K, all rights reserved. Distributed under the terms of MIT license
# @author     Fabian Tollenaar <fabian@signalk.org>

mkdir -p /tmp/canboat
wget https://github.com/canboat/canboat/archive/master.zip; unzip ./master.zip
cd ./canboat-master; make; make install

cd /opt/app/signalk-server
DEBUG=signalk* bin/signalk-server -s settings/defaults.json