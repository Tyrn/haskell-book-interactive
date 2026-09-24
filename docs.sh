#!/usr/bin/env bash
set -euo pipefail

pkg="haskell-book-interactive"
test_pkg="${pkg}-test"

usage() {
  cat <<EOF
Usage: $0 [--with-tests | --no-tests] [--open] [--internal]

  (no flags)       build HTML docs for the library only
  --with-tests     include test suites
  --no-tests       exclude test suites (default)
  --open           open the docs in your browser after building
  --internal       (disabled) include unexported modules

Package: ${pkg}
EOF
}

haddock_flags=()
open_flag=false
with_tests=false

while [ $# -gt 0 ]; do
  case "$1" in
  --with-tests)
    haddock_flags+=(--haddock-tests)
    with_tests=true
    ;;
  --no-tests) : ;;
  --internal)
    echo "Note: --internal is disabled. It forces a full recompile because" >&2
    echo "Cabal's __HADDOCK_VERSION__ macro invalidates the build cache." >&2
    echo "If you really want it, run: cabal haddock --haddock-internal" >&2
    exit 0
    ;;
  --open) open_flag=true ;;
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

if [ "$open_flag" = true ]; then
  lib_index=$(find dist-newstyle -type f -name "index.html" \
    -path "*/doc/html/${pkg}/index.html" 2>/dev/null | head -n 1)

  if [ -z "$lib_index" ]; then
    echo "No generated index.html found for ${pkg}." >&2
    exit 1
  fi

  xdg-open "$lib_index"

  if [ "$with_tests" = true ]; then
    test_index=$(find dist-newstyle -type f -name "index.html" \
      -path "*/doc/html/${pkg}/${test_pkg}/index.html" 2>/dev/null | head -n 1)
    if [ -n "$test_index" ]; then
      xdg-open "$test_index"
    fi
  fi
fi
