#!/bin/bash
set -euo pipefail

cd getting-started-master/app

docker build -t getting-started .
docker run -dp 3000:3000 getting-started