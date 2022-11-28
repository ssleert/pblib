source pblib.sh

function main() {
  pblib::str::lstrip 'asd' 'asdstrbsdstr'
}

main "$@"
exit $?
