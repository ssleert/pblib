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

function main {
  # start all test in async
  msg_test &

  wait
}

main "$@"
exit $?
