function get_array {
  local -a array_local=("$@")
  printf '%s\n' "${array_local[@]}"

  return 0
}

function main {
  IFS=$'\n'
  local -a array_global=($(get_array 'a s\n d 1' 'a s d\t 2' 'a\t s d\n 3'))
  unset IFS

  for i in "${array_global[2]}"; do
    echo -e "$i"
  done

  return 0
}

main "$@"
exit $?
