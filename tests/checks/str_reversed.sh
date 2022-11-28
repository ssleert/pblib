source pblib.sh

function main() {
  pblib::str::reverse_case 'StRiNg'
}

main "$@"
exit $?
