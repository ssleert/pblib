source pblib.sh

function main() {
  pblib::str::fstrip 'str' 'asdstrbsdstr'
}

main "$@"
exit $?
