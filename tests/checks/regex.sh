source pblib.sh

function main() {
  local -r string='string'
  pblib::str::regex "$string" "str"
}

main "$@"
exit $?
