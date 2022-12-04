source pblib.sh

function main() {
  pblib::fs::lines 'pblib.sh'
}

main "$@"
exit $?
