source pblib.sh

function main() {
  pblib::fs::cat 'pblib.sh'
}

main "$@"
exit $?
