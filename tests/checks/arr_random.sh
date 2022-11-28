source pblib.sh

function main() {
  local -ra array=(
    first
    second
    third
  )

  pblib::arr::random "${array[@]}"
}

main "$@"
exit $?
