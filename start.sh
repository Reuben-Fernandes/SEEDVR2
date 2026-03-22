#!/bin/bash
#
# SeedVR2 Pod start script
#

set -e

COMFYUI_DIR=/workspace/ComfyUI

echo ""
echo "########################################"
echo "#        SeedVR2 - Starting           #"
echo "########################################"
echo ""

# ── Download Workflows ───────────────────────────────────────────
echo "  → Downloading workflows..."
mkdir -p "$COMFYUI_DIR/user/default/workflows"
curl -fsSL https://raw.githubusercontent.com/Reuben-Fernandes/ComfyUI-Workflows/main/Upscale_with_SeedVR.json \
    -o "$COMFYUI_DIR/user/default/workflows/Upscale_with_SeedVR.json" && echo "  ✓ Upscale_with_SeedVR.json" || true

# ── Launch ComfyUI ───────────────────────────────────────────────
echo "  → Launching ComfyUI on port 8188..."
echo ""
exec python3 "$COMFYUI_DIR/main.py" \
    --listen 0.0.0.0 \
    --port 8188
