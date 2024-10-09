#!/bin/bash
set -euo pipefail

cd getting-started-master/app

cat Dockerfile << _EOF_
FROM node:20-alpine
RUN apk add --no-cache python3 g++ make
WORKDIR /app
COPY . .
RUN yarn install --production
CMD ["node", "/app/src/index.js"]
_EOF_

docker build -t getting-started .
docker run -dp 3000:3000 getting-started