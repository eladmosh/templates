#!/usr/bin/env bash
set -e

# Python
#
# Prepare runtime environment for Python scripts
echo "Prepare runtime environment for Python scripts"
# cp ../../API-Environment/config.json . # 2>&1 >/dev/null
# pip3 install --no-cache-dir -r requirements.txt # 2>&1 >/dev/null

# Environment
#
# Get environment details from Azure and Env0
echo "Get environment details from Azure and Env0"
export env_EnvironmentDetails="$(python3 ./GetEnvironmentDetails.py)"
echo -e "Environment Details:\n$env_EnvironmentDetails"
