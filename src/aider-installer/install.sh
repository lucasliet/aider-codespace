#!/bin/sh
set -e

echo "Executing install.sh for aider-installer feature"
echo "This script assumes Python and pip are already installed and configured,"
echo "typically by the 'ghcr.io/devcontainers/features/python' feature."

PYTHON_CMD=""
if command -v python >/dev/null 2>&1; then
    PYTHON_CMD="python"
elif command -v python3 >/dev/null 2>&1; then
    PYTHON_CMD="python3"
else
    echo "Error: Python (python or python3) not found."
    echo "Ensure 'ghcr.io/devcontainers/features/python' runs before this feature or that Python is in the base image."
    exit 1
fi

PIP_CMD=""
if command -v pip >/dev/null 2>&1; then
    PIP_CMD="pip"
elif command -v pip3 >/dev/null 2>&1; then
    PIP_CMD="pip3"
elif $PYTHON_CMD -m pip --version >/dev/null 2>&1; then
    PIP_CMD="$PYTHON_CMD -m pip"
else
    echo "Error: pip (pip, pip3, or $PYTHON_CMD -m pip) not found."
    echo "Ensure 'ghcr.io/devcontainers/features/python' runs before this feature and installs pip."
    exit 1
fi

echo "Using Python command: $PYTHON_CMD"
echo "Using Pip command: $PIP_CMD"

echo "Upgrading pip..."
$PIP_CMD install --upgrade pip

echo "Installing aider-chat..."
$PIP_CMD install aider-chat

echo "aider-chat installed successfully."
echo "To verify, open a new terminal after the container is built and run: aider --version"
