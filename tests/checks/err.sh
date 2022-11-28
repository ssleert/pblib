source pblib.sh

function main() {
  pblib::io::err 'err' \
                 'addon' \
                 'addon'
}

main "$@"
exit $?
