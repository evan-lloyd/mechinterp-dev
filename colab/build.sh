#!/bin/bash

cd "${0%/*}"
docker build -t runpod-colab --platform=linux/amd64 .
