source pblib.sh

function main() {
  pblib::fs::ls_recursively '.'
}

main "$@"
exit $?
