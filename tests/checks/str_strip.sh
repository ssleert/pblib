source pblib.sh

function main() {
  pblib::str::strip 'str' 'asdstrbsdstr'
}

main "$@"
exit $?
