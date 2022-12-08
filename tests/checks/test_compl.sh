source pblib.sh

function main() {
  pblib::test::test_compl true
  pblib::test::test_compl false
}

main "$@"
exit $?
