source pblib.sh

function main() {
  pblib::str::trim_quotes "'\"quoted\"'"
}

main "$@"
exit $?
