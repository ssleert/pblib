function asd.asd {
  alias asd='echo "asd"'
}

function main {
  asd.asd

  asd
}

main "$@"
exit $?
