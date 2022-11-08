source 'pblib.sh'

function test_compl {
  local test_name="$1"
  local compl_status="$2"
  shift $#

  if ! $compl_status; then
    echo -e "[ $color_white_bold$test_name()$color_reset test$color_red_bold failed$color_reset ]";
  else
    echo -e "[ $color_white_bold$test_name()$color_reset test$color_green_bold completed$color_reset ]"
  fi

  return 0
}

function msg_test {
  msg_data="$(msg 'msg' 'addon' 'addon')"
  msg_example='[1;34m::[1;37m msg[0m
[1;34m |[1;37m addon[0m
[1;34m |[1;37m addon[0m'
  if [[ $msg_data != "$msg_example" ]]; then
    test_compl "msg" false
  else
    test_compl "msg" true
  fi
}

function err_test {
  err_data="$(err 'err' 'addon' 'addon' 2>&1)"
  err_example='[1;31merror:[1;37m on 30 line in tests/test.sh of err_test() func [1;31m
     |[0m
[1;31m     |[0m err
[1;31m     |[0m addon
[1;31m     |[0m addon'

  if [[ $err_data != "$err_example" ]]; then
    test_compl 'err' false
  else
    test_compl 'err' true
  fi
}

function warn_test {
  warn_data="$(warn 'warn' 'addon' 'addon' 2>&1)"
  warn_example='[1;33mwarning:[1;37m on 45 line in tests/test.sh of warn_test() func [1;33m
       |[0m
[1;33m       |[1;37m warn[0m
[1;33m       |[1;37m addon[0m
[1;33m       |[1;37m addon[0m'

  if [[ $warn_data != "$warn_example" ]]; then
    test_compl 'warn' false
  else
    test_compl 'warn' true
  fi
}

function main {
  # start all test in async
  msg_test &
  err_test &
  warn_test &

  wait
  return 0
}

main "$@"
exit $?
