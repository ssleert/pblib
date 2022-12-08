source pblib.sh

function main() {
  pblib::fs::touch 'asd'
}

main "$@"
exit $?
