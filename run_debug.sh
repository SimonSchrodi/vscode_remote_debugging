#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
while read var value
do
    export "$var"="$value"
done < $SCRIPT_DIR/config.conf

# python args
arg1="Python"
arg2="arguments"

WORKDIR=$WORKDIR/src
cd $WORKDIR
source $CONDA_SOURCE
conda activate $CONDA_ENV
python -m debugpy --listen 0.0.0.0:$PORT --wait-for-client $WORKDIR/main.py $arg1 $arg2
conda deactivate