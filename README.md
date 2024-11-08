# vscode_remote_debugging
This repository may contain useful scripts for debugging on a remote cluster.

Note that we are using mamba (we previously used anaconda). If you do not want to use it, you can change the corresponding parts.

## How to set up once
0. Clone this repository into your current working repository, i.e., where you code cool stuff.
1. Install `debugpy` and `path`.
2. In `.vscode/launch.json`: `Add configuration` -> `Python` -> `Remote Attach`. You can add any host name and port number (we will configure this in `config.conf`). You can remove `pathMappings`. Also remove comments.
3. Adapt configurations in `vscode_remote_debugging/config.conf`.

## How to debug
0. Set up a script for debugging similar to `vscode_remote_debugging/run_debug.sh`.
1. Grab yourself a GPU, e.g. `swrap srun -p super_large_cluster --pty bash`.
2. Run `bash vscode_remote_debugging/init.sh`.
3. Run `bash vscode_remote_debugging/run_debug.sh` (might take a second to start).
4. Attach to the run via VSCode.
5. Debug as if you were running the code on your local machine.
