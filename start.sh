#!/bin/bash

echo ""
echo "########################################"
echo "#        SeedVR2 - Starting           #"
echo "########################################"
echo ""

exec python3 /workspace/ComfyUI/main.py \
    --listen 0.0.0.0 \
    --port 8188
