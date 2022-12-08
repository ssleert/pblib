source pblib.sh

function main() {
  pblib::fs::count '1' '2' '3'
}

main "$@"
exit $?
