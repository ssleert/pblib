source pblib.sh

function main() {
    pblib::io::msg 'msg' \
                   'addon' \
                   'addon'
}

main "$@"
exit $?
