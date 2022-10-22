#!/usr/bin/env bash

# project: pblib
# ver:     0.1.1
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
  local msg="$1"
  shift 1
  local addons=("$@")
  shift $#

  printf "$color_blue_bold""::$color_reset %s\n" "$msg"
  if [[ -z ${addons[*]} ]]; then
    return 0
  fi
  for addon in "${addons[@]}"; do
    printf "$color_blue_bold"" |$color_reset %s\n" "$addon"
  done

  return 0
}

function err {
  # Send error to stderr
  ## Usage: err "something went wrong but not enough to die"
  local err="$1"
  shift 1
  local addons=("$@")
  shift $#

  printf "$color_red_bold""error:$color_reset %s\n" "$err" >&2
  if [[ -z ${addons[*]} ]]; then
    return 0
  fi
  for addon in "${addons[@]}"; do
    printf "$color_red_bold""     |$color_reset %s\n" "$addon" >&2
  done

  return 0
}

function warn {
  # send warning to stdout
  ## Usage: warn "something went wrong but not enough to error"
  local warn="$1"
  shift 1
  local addons=("$@")
  shift $#

  printf "$color_yellow_bold""warning:$color_reset %s\n" "$warn"
  if [[ -z ${addons[*]} ]]; then
    return 0
  fi
  for addon in "${addons[@]}"; do
    printf "$color_yellow_bold""       |$color_reset %s\n" "$addon"
  done

  return 0
}

function compl {
  # send complete message to stdout
  ## Usage: compl "something complete"
  local msg="$1"
  shift 1
  local addons=("$@")
  shift $#

  printf "$color_green_bold"">>>$color_reset %s\n" "$msg"
  if [[ -z ${addons[*]} ]]; then
    return 0
  fi
  for addon in "${addons[@]}"; do
    printf "$color_green_bold""  |$color_reset %s\n" "$addon"
  done

  return 0
}



#
# EXITS
#

function die {
  # if it used quit is not planned)
  ## Usage: die "something very bad happened"
  local error_msgs=("$@")
  shift $#

  err "${error_msgs[@]}"

  exit 1
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
  local search="$1"
  local string="$2"
  shift $#

  if [[ "$string" == *$search* ]]; then
    return 0
  else
    return 1
  fi
}

function lower {
  # convert string to lowercase
  ## Usage: lower "LOWER"
  local string="$1"
  shift $#

  printf '%s\n' "${string,,}"

  return 0
}

function upper {
  # convert string to uppercase
  ## Usage: upper "UPPER"
  local string="$1"
  shift $#

  printf '%s\n' "${string^^}"

  return 0
}

function reverse_case {
  # reverse string case
  ## Usage: reverse_case "ReVeRsE"
  local string="$1"
  shift $#

  printf '%s\n' "${string~~}"

  return 0
}

function strip_first {
  # strip first instance of pattern from left side string
  ## Usage: strip_first "second" "first second third"
  local pattern="$1"
  local string="$2"

  printf '%s\n' "${string/"$pattern"}"

  return 0
}

function lstrip {
  # strip instance of pattern from left side of string
  ## Usage: lstrip "left" "left right"
  local pattern="$1"
  local string="$2"

  printf '%s\n' "${string##"$pattern"}"

  return 0
}

function rstrip {
  # strip instance of pattern from right side of string
  ## Usage: rstrip "right" "left right"
  local pattern="$1"
  local string="$2"

  printf '%s\n' "${string%%"$pattern"}"

  return 0
}


function strip_all {
  # strip all instances of pattern from string
  ## Usage: strip_all "all" "all all all"
  local pattern="$1"
  local string="$2"
  shift $#

  printf '%s\n' "${string//"$pattern"}"

  return 0
}

function trim_quotes {
  # trim quites from string
  ## Usage: trim_quotes "'\"quotes\"'"
  local string="$1"
  shift $#

  : "${string//\'}"
  printf '%s\n' "${_//\"}"

  return 0
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

  for element in "${array[@]}"; do
    if [[ "$element" == "$search" ]]; then
      return 0
    fi
  done

  return 1
}

function reverse_array {
  # reverse array by indexes
  ## Usage: reverse_array "<var>"
  ### where <var> is name of variable
  ### without $
  local -n array="$1"
  shift $#
  local array_copy=("${array[@]}")

  array=()

  for (( i=${#array_copy[@]}; i >= 0; i-- )); do
    array+=("${array_copy[$i]}")
  done

  return 0
}

function random_array_element {
  # choose random element from array
  # Usage: random_array_element ${array[@]}
  local array=("$@")
  shift $#

  printf '%s\n' "${array[RANDOM % ${#array[@]}]}"

  return 0
}



#
# FILES
#

function ls_recursively {
  # list files in dir recursively and write array in var
  ## Usage: ls_recursively "<var>" "./"
  ### where <var> is name of variable
  ### without $
  local -n files_array="$1"
  local dir="$2"
  shift $#

  files_array=()

  shopt -s globstar
  for file in "$dir"**/*; do
    files_array+=("$file")
  done
  shopt -u globstar

  return 0
}

function cat {
  # read content from file and print it to stdout
  ## Usage: cat "./file"
  local files=("$@")
  shift $#

  local file_data

  for file in "${files[@]}"; do
    file_data="$(<"$file")"
    echo "$file_data"
  done

  return 0
}

function head {
  # read lines from head of file and print it to stdout
  ## Usage: head 10 "./file"
  local lines="$1"
  local file="$2"
  shift $#

  local head
  mapfile -tn "$lines" head < "$file"

  printf '%s\n' "${head[@]}"

  return 0
}

function tail {
  # read lines from tail of file and print it to stdout
  ## Usage: tail 10 "./file"
  local lines="$1"
  local file=$2
  shift $#

  local file_data
  mapfile -tn 0 file_data < "$file"
  local tail=("${file_data[@]: -$lines}")

  printf '%s\n' "${tail[@]}"

  return 0
}

function lines {
  # count lines in file with mapfile
  ## Usage: lines "./file"
  local file="$1"
  shift $#

  local file_data
  mapfile -tn 0 file_data < "$file"
	local lines_count="${#file_data[@]}"

  echo "$lines_count"

  return 0
}

function lines_while {
  # count lines in file with while
  # p.s uses less ram but works much slower
  ## Usage: lines_while "./file"
  local file="$1"
  shift $#

  lines=0

  while IFS="" read -r _; do
    ((lines++))
  done < "$file"

  echo "$lines"

  return 0
}


function touch {
  # create empty file)
  ## Usage: touch "./"
  local file="$1"
  shift $#

  :>"$file"

  return 0
}

function basename {
  # read basename of file
  ## Usage: basename "./tests/test.sh"
  local file="$1"
  local suffix="$2"
  shift $#

  local basename

  basename=${file%"${##*[!/]}"}
  basename=${basename##*/}
  basename=${basename%"${suffix/"$basename"}"}

  echo "$basename"

  return 0
}

#
# OTHER
#

function count {
  # count files in dir
  ## Usage: count ./*
  local elements_count="$#"
  shift $#

  echo "$elements_count"

  return 0
}
