source pblib.sh

function main() {
  pblib::io::warn 'warn' \
                  'addon' \
                  'addon'
}

main "$@"
exit $?
