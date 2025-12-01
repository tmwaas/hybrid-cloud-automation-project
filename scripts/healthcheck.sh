#!/bin/bash
set -e

echo "[*] Checking system uptime..."
uptime

echo "[*] Checking disk usage..."
df -h | head -n 5

echo "[*] Checking k3s status (if installed)..."
if command -v k3s >/dev/null 2>&1; then
  k3s kubectl get nodes
else
  echo "k3s not installed."
fi
