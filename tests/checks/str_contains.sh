source pblib.sh

function main() {
  pblib::str::contains 'str' 'asdstrbsd'
}

main "$@"
exit $?
