#!/bin/bash

function main {
  local -a array=(
    "as\nd"
    "asd\thb"
    "asfqawsdg\rhsb"
  )

  printf '%s\n' "${array[@]}"
}

main "$@"
exit $?
