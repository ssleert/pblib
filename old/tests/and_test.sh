#!/usr/bin/env bash

source "pblib.sh"

function main {
  local string="local string for test in_string() func"

  in_string "" "$string" \
    || echo "1 arg error"

  in_string "string" "" \
    || echo "2 arg error"
}

main "$@"
exit $?
