#!/bin/bash

set -x
set -e

DIR="$( cd "$( dirname -- "$0" )" && pwd )"
export PYTHONUNBUFFERED="True"
LOG_NAME="agent"
LOG="output/${DATE}/log.txt"

MODEL_NAME=${1-"dummy"}
RUN_NUM=${2-3}
EPI_NUM=${3-165}
EPOCH=${4-latest}
LOG="outputs/${MODEL_NAME}/test_log.txt.`date +'%Y-%m-%d_%H-%M-%S'`"
exec &> >(tee -a "$LOG")
echo Logging output to "$LOG"

python3 -m core.train_test_offline  --pretrained output/22_06_2022_15:31:51 --test --render