#!/bin/bash
set -euo pipefail

pwd
ls
cd getting-started-master
pwd
ls
cd app
pwd
ls

#docker build -t getting-started .
#docker run -dp 3000:3000 getting-started