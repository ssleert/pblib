#!/usr/bin/env bash

# project: pblib
# author:  ssleert



#
# COLORS
#

# Reset colors
export color_reset='\033[0m'

# Regular Colors
export color_black='\033[0;30m'
export color_red='\033[0;31m'
export color_green='\033[0;32m'
export color_yellow='\033[0;33m'
export color_blue='\033[0;34m'
export color_purple='\033[0;35m'
export color_cyan='\033[0;36m'
export color_white='\033[0;37m'

# High intensity colors
export color_black_hintensity='\033[0;90m'
export color_red_hintensity='\033[0;91m'
export color_green_hintensity='\033[0;92m'
export color_yellow_hintensity='\033[0;93m'
export color_blue_hintensity='\033[0;94m'
export color_purple_hintensity='\033[0;95m'
export color_cyan_hintensity='\033[0;96m'
export color_white_hintensity='\033[0;97m'

# Bold Colors
export color_black_bold='\033[1;30m'
export color_red_bold='\033[1;31m'
export color_green_bold='\033[1;32m'
export color_yellow_bold='\033[1;33m'
export color_blue_bold='\033[1;34m'
export color_purple_bold='\033[1;35m'
export color_cyan_bold='\033[1;36m'
export color_white_bold='\033[1;37m'

# Bold high intensity Colors
export color_black_bold_hintensity='\033[1;90m'
export color_red_bold_hintensity='\033[1;91m'
export color_green_bold_hintensity='\033[1;92m'
export color_yellow_bold_hintensity='\033[1;93m'
export color_blue_bold_hintensity='\033[1;94m'
export color_purple_bold_hintensity='\033[1;95m'
export color_cyan_bold_hintensity='\033[1;96m'
export color_white_bold_hintensity='\033[1;97m'

# Underline colors
export color_black_underline='\033[4;30m'
export color_red_underline='\033[4;31m'
export color_green_underline='\033[4;32m'
export color_yellow_underline='\033[4;33m'
export color_blue_underline='\033[4;34m'
export color_purple_underline='\033[4;35m'
export color_cyan_underline='\033[4;36m'
export color_white_underline='\033[4;37m'

# Background colors
export color_black_background='\033[40m'
export color_red_background='\033[41m'
export color_green_background='\033[42m'
export color_yellow_background='\033[43m'
export color_blue_background='\033[44m'
export color_purple_background='\033[45m'
export color_cyan_background='\033[46m'
export color_white_background='\033[47m'

# Background high intensity colors
export color_black_background_hintensity='\033[0;100m'
export color_red_background_hintensity='\033[0;101m'
export color_green_background_hintensity='\033[0;102m'
export color_yellow_background_hintensity='\033[0;103m'
export color_blue_background_hintensity='\033[0;104m'
export color_purple_background_hintensity='\033[0;105m'
export color_cyan_background_hintensity='\033[0;106m'
export color_white_background_hintensity='\033[0;107m'



#
# PRINTS
#

function msg {
  # Send message to stdout
  ## Usage: msg "message for user"
  local messages=("$@")
  shift $#

  if [[ ${#messages[@]} -eq 0 ]]; then
    return 1
  else
    echo -e "$color_blue_bold::$color_white_bold ${messages[0]}$color_reset"
    for message in "${messages[@]:1}"; do
      echo -e "$color_blue_bold |$color_white_bold $message$color_reset"
    done
    return 0
  fi
}

function err {
  # Send error to stderr
  ## Usage: err "something went wrong but not enough to die"
  local errors=("$@")
  shift $#

  if [[ ${#errors[@]} -eq 0 ]]; then
    return 1
  else
    echo -e "$color_red_bold""error:$color_white_bold on ${BASH_LINENO[0]} line in ${BASH_SOURCE[1]} of ${FUNCNAME[1]}() func" \
            "$color_red_bold\n     |$color_reset" >&2
    for error in "${errors[@]}"; do
      echo -e "$color_red_bold     |$color_reset $error" >&2
    done
    return 0
  fi
}

function warn {
  # send warning to stdout
  ## Usage: warn "something went wrong but not enough to error"
  local warnings=("$@")
  shift $#

  if [[ ${#warnings[@]} -eq 0 ]]; then
    return 1
  else
    echo -e "$color_yellow_bold""warning:$color_white_bold on ${BASH_LINENO[0]} line in ${BASH_SOURCE[1]} of ${FUNCNAME[1]}() func" \
            "$color_yellow_bold\n       |$color_reset"
    for warning in "${warnings[@]}"; do
      echo -e "$color_yellow_bold       |$color_reset $warning"
    done
    return 0
  fi

}

function compl {
  # send complete message to stdout
  ## Usage: compl "something complete"
  local messages=("$@")
  shift $#

  if [[ ${#messages[@]} -eq 0 ]]; then
    return 1
  else
    echo -e "$color_green_bold>>>$color_white_bold ${messages[0]}$color_reset"
    for message in "${messages[@]:1}"; do
      echo -e "$color_green_bold  |$color_white_bold $message$color_reset"
    done
    return 0
  fi
}



#
# EXITS
#

function die {
  # if it used quit is not planned)
  ## Usage: die "something very bad happened"
  local errors=("$@")
  shift $#

  if [[ ${#errors[@]} -eq 0 ]]; then
    exit 1
  else
    echo -e "$color_red_bold""error:$color_white_bold on ${BASH_LINENO[0]} line in ${BASH_SOURCE[1]} of ${FUNCNAME[1]}() func" \
            "$color_red_bold\n     |$color_reset" >&2
    for error in "${errors[@]}"; do
      echo -e "$color_red_bold     |$color_reset $error" >&2
    done
    exit 1
  fi
}

function quit {
  # if it used quit is planned)
  exit 0
}



#
# STRINGS
#

function in_string {
  # search for the value in string
  ## Usage: in_string "pattern" "pattern in string"
  local pattern="$1"
  local string="$2"
  shift $#

  if [[ -z $pattern || -z $string ]]; then
    return 1
  else
    if [[ $string == *$pattern* ]]; then
      return 0
    else
      return 1
    fi
  fi
}

function lower {
  # convert string to lowercase
  ## Usage: lower "LOWER"
  local string="$1"
  shift $#

  if [[ -z $string ]]; then
    return 1
  else
    local lowered="${string,,}"
    echo "$lowered"
    return 0
  fi
}

function upper {
  # convert string to uppercase
  ## Usage: upper "UPPER"
  local string="$1"
  shift $#

  if [[ -z $string ]]; then
    return 1
  else
    local uppered="${string^^}"
    echo "$uppered"
    return 0
  fi
}

function reverse_case {
  # reverse string case
  ## Usage: reverse_case "ReVeRsE"
  local string="$1"
  shift $#

  if [[ -z $string ]]; then
    return 1
  else
    local reversed="${string~~}"
    echo "$reversed"
    return 0
  fi
}

function strip_first {
  # strip first instance of pattern from left side string
  ## Usage: strip_first "second" "first second third"
  local pattern="$1"
  local string="$2"
  shift $#

  if [[ -z $pattern || -z $string ]]; then
    return 1
  else
    local striped="${string/"$pattern"}"
    echo "$striped"
    return 0
  fi
}

function lstrip {
  # strip instance of pattern from left side of string
  ## Usage: lstrip "left" "left right"
  local pattern="$1"
  local string="$2"
  shift $#

  if [[ -z $pattern || -z $string ]]; then
    return 1
  else
    local striped="${string##"$pattern"}"
    echo "$striped"
    return 0
  fi
}

function rstrip {
  # strip instance of pattern from right side of string
  ## Usage: rstrip "right" "left right"
  local pattern="$1"
  local string="$2"
  shift $#

  if [[ -z $pattern || -z $string ]]; then
    return 1
  else
    local striped="${string%%"$pattern"}"
    echo "$striped"
    return 0
  fi
}


function strip_all {
  # strip all instances of pattern from string
  ## Usage: strip_all "all" "all all all"
  local pattern="$1"
  local string="$2"
  shift $#

  if [[ -z $pattern || -z $string ]]; then
    return 1
  else
    local striped="${string//$pattern}"
    echo "$striped"
    return 0
  fi
}

function trim_quotes {
  # trim quites from string
  ## Usage: trim_quotes "'\"quotes\"'"
  local string="$1"
  shift $#

  if [[ -z $string ]]; then
    return 1
  else
    local trimmed="${string//\'}"
    local trimmed="${trimmed//\"}"
    echo "$trimmed"
    return 0
  fi
}



#
# ARRAYS
#

function in_array {
  # search for the value in array
  ## Usage: in_array "milk" ("tea" "milk" "bread")
  local search="$1"
  shift 1
  local array=("$@")
  shift $#

  if [[ -z $search || ${#array[@]} -eq 0 ]]; then
    return 1
  else
    for element in "${array[@]}"; do
      if [[ "$element" == "$search" ]]; then
        return 0
      fi
    done
    return 1
  fi
}

function reverse_array {
  # reverse array by indexes
  ## Usage: reverse_array "<var>"
  ### where <var> is name of variable
  ### without $
  local -n array="$1"
  shift $#

  if [[ -R $array || ${#array[@]} -le 1 ]]; then
    return 1
  else
    local array_copy=("${array[@]}")
    array=()
    for (( i=${#array_copy[@]}; i >= 0; i-- )); do
      array+=("${array_copy[$i]}")
    done
    return 0
  fi
}

function random_array_element {
  # choose random element from array
  # Usage: random_array_element ${array[@]}
  local array=("$@")
  shift $#

  if [[ ${#array[@]} -le 1 ]]; then
    return 1
  else
    local element="${array[RANDOM % ${#array[@]}]}"
    echo "$element"
    return 0
  fi
}



#
# FILES
#

function ls_recursively {
  # list files in dir recursively and write array in var
  ## Usage: ls_recursively "<var>" "."
  ### where <var> is name of variable
  ### without $
  local -n files_array="$1"
  local dir="$2"
  shift $#

  if [[ -R $files_array || -z $dir ]]; then
    return 1
  else
    files_array=()
    shopt -s globstar
    for file in "$dir"/**/*; do
      files_array+=("$file")
    done
    shopt -u globstar
    return 0
  fi
}

function cat {
  # read content from file and print it to stdout
  ## Usage: cat "./file"
  local files=("$@")
  shift $#

  if [[ ${#files[@]} == 0 ]]; then
    return 1
  else
    local file_data
    for file in "${files[@]}"; do
      file_data="$(<"$file")"
      echo "$file_data"
    done
    return 0
  fi
}

function head {
  # read lines from head of file and print it to stdout
  ## Usage: head 10 "./file"
  local lines="$1"
  local file="$2"
  shift $#

  if [[ -z $lines || -z $file ]]; then
    return 1
  else
    local file_data
    mapfile -tn "$lines" file_data < "$file"
    printf '%s\n' "${file_data[@]}"
    return 0
  fi
}

function tail {
  # read lines from tail of file and print it to stdout
  ## Usage: tail 10 "./file"
  local lines="$1"
  local file="$2"
  shift $#

  if [[ -z $lines || -z $file ]]; then
    return 1
  else
    if [[ ! -f $file ]]; then
      return 1
    else
      local file_data
      mapfile -tn 0 file_data < "$file"
      local tail=("${file_data[@]: -$lines}")
      printf '%s\n' "${tail[@]}"
      return 0
    fi
  fi
}

function lines {
  # count lines in file with mapfile
  ## Usage: lines "./file"
  local file="$1"
  shift $#

  if [[ -z $file ]]; then
    return 1
  else
    if [[ ! -f $file ]]; then
      return 1
    else
      local file_data
      mapfile -tn 0 file_data < "$file"
      local lines_count="${#file_data[@]}"
      echo "$lines_count"
      return 0
    fi
  fi
}

function lines_while {
  # count lines in file with while
  # p.s uses less ram but works much slower
  ## Usage: lines_while "./file"
  local file="$1"
  shift $#

  if [[ -z $file ]]; then
    return 1
  else
    if [[ ! -f $file ]]; then
      return 1
    else
      lines=0
      while IFS="" read -r _; do
        ((lines++))
      done < "$file"
      echo "$lines"
      return 0
    fi
  fi
}


function touch {
  # create empty file)
  ## Usage: touch "./"
  local file="$1"
  shift $#

  if [[ -z $file ]]; then
    return 1
  else
    :>"$file"
    if [[ $? -ne 0 ]]; then
      return 1
    else
      return 0
    fi
  fi
}

function basename {
  # read basename of file
  ## Usage: basename "./tests/test.sh"
  local file="$1"
  local suffix="$2"
  shift $#

  if [[ -z $file ]]; then
    return 1
  else
    local basename
    basename=${file%"${##*[!/]}"}
    basename=${basename##*/}
    basename=${basename%"${suffix/"$basename"}"}
    echo "$basename"

    return 0
  fi
}



#
# OTHER
#

function count {
  # count files in dir
  ## Usage: count ./*
  local elements_count="$#"
  shift $#

  if [[ $elements_count -eq 0 ]]; then
    return 1
  else
    echo "$elements_count"
    return 0
  fi
}

function in_path {
  # check is program in path
  ## Usage: in_path "nmtui"
  local program_name="$1"
  shift $#

  if ! type -p "$program_name" &> /dev/null; then
    return 1
  else
    return 0
  fi
}

function check_sudo {
  # check is sudo in path and activate it
  ## Usage: check_sudo
  shift $#
  local su_program="sudo"

  if ! in_path "$su_program"; then
    return 1
  else
    $su_program true
    if [[ $? -ne 0 ]]; then
      return 1
    else 
      return 0
    fi
  fi
}

function read_sleep {
  # sleep execution through file descriptor
  ## Usage: read_sleep 1
  local sleep_time="$1"
  shift $#

  read -rt "$sleep_time" <> <(:) || : 
  if [[ $? -ne 0 ]]; then
    return 1
  else
    return 0
  fi
}

export PBLIB_LOADED=1
