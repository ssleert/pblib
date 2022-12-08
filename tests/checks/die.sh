source pblib.sh

function main() {
  pblib::die 2 'err' \
               'addon' \
               'addon'
}

main "$@"
exit $?
