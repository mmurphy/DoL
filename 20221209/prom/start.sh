#!/usr/bin/env bash
#
# 
# Create named volume if it doesn't exist
podman volume exists prometheusdata || podman volume create prometheusdata

#
podman run -d --name prometheus \
           -v prometheusdata:/prometheus \
           -v $PWD/prometheusconfig:/etc/prometheus \
           -p 9090:9090 \
           quay.io/prometheus/prometheus
