source pblib.sh

function main() {
  local -a array=(
    first
    second
    third
  )

  array+=('second')

  pblib::arr::contains 'first' "${array[@]}"
}

main "$@"
exit $?
