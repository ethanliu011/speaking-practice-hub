#!/usr/bin/env bash
set -e

cd "$(dirname "$0")"

PORT=8000
URL="http://127.0.0.1:${PORT}/SpeakingHub.html"

echo "============================================"
echo "  Speaking Practice Hub - Local Server"
echo "============================================"
echo
echo "NOTE: Opening SpeakingHub.html directly (file://)"
echo "will NOT work. Browsers block local folder"
echo "access on the file:// protocol."
echo

open_url() {
  if command -v open >/dev/null 2>&1; then
    (open "$URL" >/dev/null 2>&1 &) || true      # macOS
  elif command -v xdg-open >/dev/null 2>&1; then
    (xdg-open "$URL" >/dev/null 2>&1 &) || true  # Linux
  fi
}

run() {
  local label="$1"; shift
  echo "[OK] ${label} found. Starting server on port ${PORT}..."
  echo "     Press Ctrl+C in this window to stop."
  echo "     Open: ${URL}"
  echo
  open_url
  exec "$@"
}

# 依次探测本机已有的运行时，找到就用，无需预先安装 Python / Node.js
if   command -v python3 >/dev/null 2>&1; then
  run "python3" python3 -m http.server "$PORT" --bind 127.0.0.1
elif command -v python >/dev/null 2>&1; then
  run "python"  python  -m http.server "$PORT" --bind 127.0.0.1
elif command -v node >/dev/null 2>&1; then
  run "Node.js" npx --yes serve -l "$PORT"
elif command -v ruby >/dev/null 2>&1; then
  run "Ruby (macOS built-in)" ruby -run -e httpd . -p "$PORT" -b 127.0.0.1
else
  echo "[ERROR] No usable runtime found (need Python / Node.js / Ruby)."
  echo
  echo "Pick ONE of the following, then re-run ./start.sh:"
  echo
  echo "  macOS         : xcode-select --install"
  echo "  Ubuntu/Debian : sudo apt install python3"
  echo "  CentOS/RHEL   : sudo yum install python3"
  echo "  Alpine        : apk add python3"
  echo
  echo "  Or download Python: https://www.python.org/downloads/"
  echo
  exit 1
fi
