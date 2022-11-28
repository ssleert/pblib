source pblib.sh

function main() {
  pblib::str::upper 'string'
}

main "$@"
exit $?
