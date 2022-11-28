source pblib.sh

function main() {
  local -ra array=(
    first
    second
    third
  )

  pblib::arr::reverse "${array[@]}"
}

main "$@"
exit $?
