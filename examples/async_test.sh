#!/bin/bash

function async1 {
  local a=0
  while [[ $a -lt '10000' ]]; do
    ((a=a+1))
    echo "$a"
  done
}

function async2 {
  local a=0
  while [[ $a -gt '-10000' ]]; do
    ((a=a-1))
    echo "$a"
  done
}

function main {
  async1 &
  async2 &
  wait
}

main "$@"
exit $?
