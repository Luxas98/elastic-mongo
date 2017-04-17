#!/bin/bash

MONGO=`ping -c 1 mongo1 | head -1  | cut -d "(" -f 2 | cut -d ")" -f 1`
ES=`ping -c 1 elasticsearch | head -1  | cut -d "(" -f 2 | cut -d ")" -f 1`

# This script should only start transporter. The installation should be done in an image.

cd $GOPATH; mkdir pkg
mkdir -p src/github.com/compose; cd src/github.com/compose
git clone https://github.com/compose/transporter; cd transporter
git checkout
go build ./cmd/transporter/...

cp transporter /usr/bin/.

/scripts/wait-until-started.sh

cd /transporter
transporter run --config ./config.yaml ./mongo-es.js
