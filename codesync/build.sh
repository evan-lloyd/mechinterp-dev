#!/bin/bash
cd "${0%/*}"
docker build . --tag codesync

