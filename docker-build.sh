#!/bin/bash

set -xe

docker build -t alkima/gitautodeploy . --pull
docker push alkima/gitautodeploy
