#!/bin/sh
if [ -z "${SERVE:-}" ]; then
  SERVE="$(pwd)"
fi
HTTP_PATH=$(grep 'Path:' .request | awk '{print $2}')
HTTP_PATH=$(printf '%b' "${HTTP_PATH//%/\\x}")
export HTTP_PATH
CWD="${SERVE}${HTTP_PATH}"
CWD=${CWD/"//"/"/"}
export CWD
IP=$(grep 'IP:' .request | awk '{print $2}')
METHOD=$(grep 'Method:' .request | awk '{print $2}')
UA=$(grep 'Header.User-Agent:' .request | awk '{print $2}')
LANG=$(grep 'Header.Accept-Language:' .request | awk '{print $2}')
USERNAME=$(grep 'Cred.Username:' .request | awk '{print $2}')
NETWORK=$(grep 'Cred.Username:' .request | awk '{print $2}')
export IP
export METHOD
export UA
export LANG
export USERNAME
export NETWORK
echo "islekcaganmert-fileserver/1.0 200"
if [ -f $CWD ]; then
  pages/serve_file.sh
  exit
fi
if [ -f $CWD/index.html ]; then
  echo "Content-Type: text/html;charset=UTF-8"
  echo ""
  cat $CWD/index.html
  exit
fi
pages/generate_listing.sh
echo ""

