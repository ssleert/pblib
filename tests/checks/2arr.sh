source pblib.sh

function main() {
  IFS=$'\n'
  local -ar array=($(pblib::str::2arr 'as\n  d'))
  unset IFS

  for i in "${array[@]}"; do
    printf '%s|||' "${i}"
  done
}

main "$@"
exit $?
