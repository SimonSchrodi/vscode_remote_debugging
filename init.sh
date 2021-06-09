#!/bin/bash

#swrap srun -p testdlc_gpu-rtx2080 --pty bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
while read var value
do
    export "$var"="$value"
done < $SCRIPT_DIR/config.conf

cd $WORKDIR
source $CONDA_SOURCE
conda activate $CONDA_ENV

ip=$(ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1')
python debug/_init.py --ip $ip --port $PORT --path $LAUNCH_JSON
conda deactivate