source pblib.sh

function main() {
  pblib::fs::lines_while 'pblib.sh'
}

main "$@"
exit $?
