#!/usr/bin/env bash
#
# 
# Create named volume if it doesn't exist
podman volume exists grafana-storage || podman volume create grafana-storage

#
podman run -d --name grafana \
           -v grafana-storage:/var/lib/grafana \
           -p 3000:3000 \
           grafana/grafana-oss
