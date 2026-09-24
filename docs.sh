#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<EOF
Usage: $0 [--with-tests | --no-tests | --internal]

  (no args)      build HTML docs for the library only
  --with-tests   build HTML docs including test suites
  --no-tests     build HTML docs excluding test suites (default)
  --internal     build docs including unexported modules

Examples:
  $0
  $0 --with-tests
  $0 --with-tests --internal
EOF
}

haddock_flags=()

while [ $# -gt 0 ]; do
  case "$1" in
  --with-tests) haddock_flags+=(--haddock-tests) ;;
  --no-tests) : ;; # default, nothing to add
  --internal) haddock_flags+=(--haddock-internal) ;;
  -h | --help)
    usage
    exit 0
    ;;
  *)
    echo "Unknown option: $1" >&2
    usage
    exit 1
    ;;
  esac
  shift
done

cabal haddock "${haddock_flags[@]}"
