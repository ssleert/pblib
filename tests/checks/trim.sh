source pblib.sh

function main() {
  pblib::str::trim '  asda    '
}

main "$@"
exit $?
