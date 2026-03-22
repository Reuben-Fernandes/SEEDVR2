# ── Base ─────────────────────────────────────────────────────────
FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive
ENV PYTHONUNBUFFERED=1

WORKDIR /workspace

# ── System Dependencies ──────────────────────────────────────────
RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends \
        python3 \
        python3-pip \
        python3-dev \
        git \
        git-lfs \
        ffmpeg \
        libgl1 \
        libglib2.0-0 \
    && rm -rf /var/lib/apt/lists/* \
    && rm -f /usr/lib/python3.12/EXTERNALLY-MANAGED

# ── ComfyUI ──────────────────────────────────────────────────────
RUN git clone https://github.com/comfyanonymous/ComfyUI.git /workspace/ComfyUI
RUN pip install -r /workspace/ComfyUI/requirements.txt --quiet

# ── SeedVR2 Node ─────────────────────────────────────────────────
RUN git clone https://github.com/numz/ComfyUI-SeedVR2_VideoUpscaler \
        /workspace/ComfyUI/custom_nodes/ComfyUI-SeedVR2_VideoUpscaler && \
    pip install -r /workspace/ComfyUI/custom_nodes/ComfyUI-SeedVR2_VideoUpscaler/requirements.txt \
        --quiet || true

# ── Ports ────────────────────────────────────────────────────────
EXPOSE 8188

# ── Start Script ─────────────────────────────────────────────────
COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]
