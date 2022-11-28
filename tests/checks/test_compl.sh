source pblib.sh

function main() {
  pblib::test_compl true
  pblib::test_compl false
}

main "$@"
exit $?
