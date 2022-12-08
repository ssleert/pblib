source pblib.sh

function main() {
  pblib::fs::basename '/usr/local/lib/pblib.sh' '.sh'
}

main "$@"
exit $?
