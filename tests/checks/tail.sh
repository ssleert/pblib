source pblib.sh

function main() {
  pblib::fs::tail 5 'pblib.sh'
}

main "$@"
exit $?
