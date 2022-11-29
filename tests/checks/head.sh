source pblib.sh

function main() {
  pblib::fs::head 5 'pblib.sh'
}

main "$@"
exit $?
