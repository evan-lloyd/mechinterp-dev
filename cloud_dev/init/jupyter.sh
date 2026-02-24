#!/bin/bash
JUPYTER_TOKEN=`cat /init/jupyter_token` WANDB_API_KEY=`cat /init/wandb_api_key` HF_TOKEN=`cat /init/hf_token` \
    PYDEVD_DISABLE_FILE_VALIDATION=1 \
    uv run jupyter lab --ip 0.0.0.0 --allow-root --no-browser
