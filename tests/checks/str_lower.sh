source pblib.sh

function main() {
  pblib::str::lower 'STRING'
}

main "$@"
exit $?
