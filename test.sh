#!/usr/bin/env bash

set -euo pipefail

# Yet another way to run tests;
# this one without cabal test.
TEST_SUITE="haskell-book-interactive-test"

usage() {
  cat <<EOF
Usage: $0 [NUMBER | PATH]

  (no args)    run all tests
  NUMBER       run a chapter by number, e.g. 3
  PATH         run by full match path, e.g. 'Appendix A/context'

Examples:
  $0
  $0 3
  $0 '/Chapter 3/concat'
  $0 'datatypes'
EOF
}

arg="${1:-}"

if [ "$arg" = "-h" ] || [ "$arg" = "--help" ]; then
  usage
  exit 0
fi

if [ -z "$arg" ]; then
  cabal run "$TEST_SUITE" -- --format=specdoc
elif [[ "$arg" =~ ^[0-9]+$ ]]; then
  cabal run "$TEST_SUITE" -- --format=specdoc --match="/Chapter $arg"
else
  cabal run "$TEST_SUITE" -- --format=specdoc --match="$arg"
fi
