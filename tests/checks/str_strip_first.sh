source pblib.sh

function main() {
  pblib::str::stripf 'str' 'asdstrbsdstr'
}

main "$@"
exit $?
