source pblib.sh

function main() {
  pblib::die 12 'err' \
                'addon' \
                'addon'
}

main "$@"
exit $?
