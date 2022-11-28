source pblib.sh

function main() {
  pblib::str::rstrip 'str' 'asdstrbsdstr'
}

main "$@"
exit $?
