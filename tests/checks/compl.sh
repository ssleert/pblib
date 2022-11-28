source pblib.sh

function main() {
  pblib::io::compl 'msg' \
                   'addon' \
                   'addon'
}

main "$@"
exit $?
