#!/usr/bin/env bash

set -euo pipefail

# Yet another way to run tests;
# this one without cabal test.
TEST_SUITE="haskell-book-interactive-test"

if [ -n "${1:-}" ]; then
  # Just Chapter n
  cabal run "$TEST_SUITE" -- --format=specdoc --match="/Chapter $1"
else
  # All tests
  cabal run "$TEST_SUITE" -- --format=specdoc
fi
