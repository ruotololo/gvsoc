#!/bin/bash

# One-time config for gvsoc installation

# Create a venv environment
python3 -m venv .venv
source ".venv/bin/activate"

# Install dependencies
pip3 install -r requirements.txt
pip3 install -r core/requirements.txt
pip3 install -r gapy/requirements.txt
