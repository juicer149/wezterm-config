#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "[terminal:wezterm] install start"

# --------------------------------------------------
# 1. Environment
# --------------------------------------------------

if ! grep -qi microsoft /proc/version 2>/dev/null; then
  echo "[error] wezterm bootstrap currently supports WSL only"
  exit 1
fi

# --------------------------------------------------
# 2. Windows user profile
# --------------------------------------------------

WIN_PROFILE="$(cmd.exe /c 'echo %USERPROFILE%' 2>/dev/null | tr -d '\r' | tail -n 1)"

if [[ -z "$WIN_PROFILE" ]]; then
  echo "[error] could not determine Windows USERPROFILE"
  exit 1
fi

WIN_PROFILE_WSL="$(wslpath "$WIN_PROFILE")"
WEZTERM_CONFIG_DIR="$WIN_PROFILE_WSL/.config/wezterm"
WEZTERM_CONFIG="$WEZTERM_CONFIG_DIR/wezterm.lua"

echo "[wezterm] Windows profile: $WIN_PROFILE"
echo "[wezterm] config: $WEZTERM_CONFIG"

# --------------------------------------------------
# 3. WSL path to repository
# --------------------------------------------------

DISTRO="${WSL_DISTRO_NAME:-Ubuntu}"
REPO_WIN_PATH="$(wslpath -w "$REPO_DIR")"

# Convert C:\... style path is not what we want here.
# WezTerm runs on Windows and can access the WSL filesystem
# directly through \\wsl.localhost\<distro>\...
REPO_WSL_PATH="\\\\wsl.localhost\\${DISTRO}${REPO_DIR//\//\\}"

# --------------------------------------------------
# 4. Protect existing config
# --------------------------------------------------

mkdir -p "$WEZTERM_CONFIG_DIR"

if [[ -e "$WEZTERM_CONFIG" ]]; then
  if grep -Fq "$REPO_WSL_PATH" "$WEZTERM_CONFIG"; then
    echo "[=] wezterm bridge already installed"
    echo "[terminal:wezterm] install done"
    exit 0
  fi

  echo "[error] existing WezTerm config found:"
  echo "        $WEZTERM_CONFIG"
  echo "[error] refusing to overwrite it"
  exit 1
fi

# --------------------------------------------------
# 5. Windows -> WSL config bridge
# --------------------------------------------------

cat > "$WEZTERM_CONFIG" <<EOF
package.path =
  [[${REPO_WSL_PATH}\\?.lua;]] ..
  [[${REPO_WSL_PATH}\\?\\init.lua;]] ..
  package.path

return dofile(
  [[${REPO_WSL_PATH}\\wezterm.lua]]
)
EOF

echo "[write] $WEZTERM_CONFIG"
echo "[terminal:wezterm] install done"
