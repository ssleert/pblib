#!/usr/bin/env bash
#
# pblib - pure bash lib
# author: ssleert
# link: https://github.com/ssleert/pblib

export clr_reset='\033[0m'

export clr_black='\033[0;30m'
export clr_red='\033[0;31m'
export clr_green='\033[0;32m'
export clr_yellow='\033[0;33m'
export clr_blue='\033[0;34m'
export clr_purple='\033[0;35m'
export clr_cyan='\033[0;36m'
export clr_white='\033[0;37m'

export clr_black_hintensity='\033[0;90m'
export clr_red_hintensity='\033[0;91m'
export clr_green_hintensity='\033[0;92m'
export clr_yellow_hintensity='\033[0;93m'
export clr_blue_hintensity='\033[0;94m'
export clr_purple_hintensity='\033[0;95m'
export clr_cyan_hintensity='\033[0;96m'
export clr_white_hintensity='\033[0;97m'

export clr_black_bold='\033[1;30m'
export clr_red_bold='\033[1;31m'
export clr_green_bold='\033[1;32m'
export clr_yellow_bold='\033[1;33m'
export clr_blue_bold='\033[1;34m'
export clr_purple_bold='\033[1;35m'
export clr_cyan_bold='\033[1;36m'
export clr_white_bold='\033[1;37m'

export clr_black_bold_hintensity='\033[1;90m'
export clr_red_bold_hintensity='\033[1;91m'
export clr_green_bold_hintensity='\033[1;92m'
export clr_yellow_bold_hintensity='\033[1;93m'
export clr_blue_bold_hintensity='\033[1;94m'
export clr_purple_bold_hintensity='\033[1;95m'
export clr_cyan_bold_hintensity='\033[1;96m'
export clr_white_bold_hintensity='\033[1;97m'

export clr_black_underline='\033[4;30m'
export clr_red_underline='\033[4;31m'
export clr_green_underline='\033[4;32m'
export clr_yellow_underline='\033[4;33m'
export clr_blue_underline='\033[4;34m'
export clr_purple_underline='\033[4;35m'
export clr_cyan_underline='\033[4;36m'
export clr_white_underline='\033[4;37m'

export clr_black_background='\033[40m'
export clr_red_background='\033[41m'
export clr_green_background='\033[42m'
export clr_yellow_background='\033[43m'
export clr_blue_background='\033[44m'
export clr_purple_background='\033[45m'
export clr_cyan_background='\033[46m'
export clr_white_background='\033[47m'

export clr_black_background_hintensity='\033[0;100m'
export clr_red_background_hintensity='\033[0;101m'
export clr_green_background_hintensity='\033[0;102m'
export clr_yellow_background_hintensity='\033[0;103m'
export clr_blue_background_hintensity='\033[0;104m'
export clr_purple_background_hintensity='\033[0;105m'
export clr_cyan_background_hintensity='\033[0;106m'
export clr_white_background_hintensity='\033[0;107m'

function pblib::test_compl() {
  local -r compl_status="$1"
  shift $#

  if [[ $compl_status = false ]]; then
    printf "[ %s() ${clr_red_bold}failed${clr_reset} ]\n" "${FUNCNAME[1]}"
    return 1
  else
    printf "[ %s() ${clr_green_bold}completed${clr_reset} ]\n" "${FUNCNAME[1]}"
    return 0
  fi
}

function pblib::io::msg() {
  local -r messages=("$@")
  shift $#

  if [[ -z ${messages[0]} || -z ${messages[-1]} ]]; then
    return 1
  else
    printf "${clr_blue_bold}::${clr_white_bold} %s${clr_reset}\n" "${messages[0]}"
    for message in "${messages[@]:1}"; do
      printf "${clr_blue_bold} |${clr_white_bold} %s${clr_reset}\n" "${message}"
    done
    return 0
  fi
}

function pblib::io::compl() {
  local -r messages=("$@")
  shift $#

  if [[ -z ${messages[0]} || -z ${messages[-1]} ]]; then
    return 1
  else
    printf "${clr_green_bold}>>>${clr_white_bold} %s${clr_reset}\n" "${messages[0]}"
    for message in "${messages[@]:1}"; do
      printf "${clr_green_bold}  |${clr_white_bold} %s${clr_reset}\n" "${message}"
    done
    return 0
  fi
}

function pblib::io::err() {
  local -r messages=("$@")
  shift $#

  if [[ -z ${messages[0]} || -z ${messages[-1]} ]]; then
    return 1
  else
    printf "${clr_red_bold}error: ${clr_white_bold}on %u line in %s of %s() func\n     ${clr_red_bold}|${clr_reset}\n" "${BASH_LINENO[0]}" "${BASH_SOURCE[1]}" "${FUNCNAME[1]}" >&2
    for message in "${messages[@]}"; do
      printf "     ${clr_red_bold}|${clr_reset} %s\n" "${message}" >&2
    done
    return 0
  fi
}

function pblib::io::warn() {
  local -r messages=("$@")
  shift $#

  if [[ -z ${messages[0]} || -z ${messages[-1]} ]]; then
    return 1
  else
    printf "${clr_yellow_bold}warning:${clr_white_bold} on %u line in %s of %s() func\n       ${clr_yellow_bold}|${clr_reset}\n" "${BASH_LINENO[0]}" "${BASH_SOURCE[1]}" "${FUNCNAME[1]}" >&2
    for warning in "${messages[@]}"; do
      printf "${clr_yellow_bold}       |${clr_reset} %s\n" "${warning}" >&2
    done
    return 0
  fi
}

function pblib::die() {
  local -ir exit_code="$1"
  shift 1
  local -r messages=("$@")
  shift $#

  if [[ -z ${messages[0]} || -z ${messages[-1]} ]]; then
    exit "${exit_code}"
  else
    printf "${clr_red_bold}error: ${clr_white_bold}on %u line in %s of %s() func\n     ${clr_red_bold}|${clr_reset}\n" "${BASH_LINENO[0]}" "${BASH_SOURCE[1]}" "${FUNCNAME[1]}" >&2
    for message in "${messages[@]}"; do
      printf "     ${clr_red_bold}|${clr_reset} %s\n" "${message}" >&2
    done    

    if (( exit_code == 0 )); then
      exit 1
    else
      exit "${exit_code}"
    fi
  fi
}

function pblib::quit() {
  exit 0
}

function pblib::str::contains() {
  local -r pattern="$1"
  local -r string="$2"
  shift $#

  if [[ -z $pattern || -z $string ]]; then
    return 1
  elif [[ $string == *$pattern* ]]; then
    return 0
  else
    return 1
  fi
}

function pblib::str::lower() {
  local -r string="$1"
  shift $#

  if [[ -z $string ]]; then
    return 1
  else
    local -r lowered="${string,,}"
    printf '%s\n' "${lowered}" 
    return 0
  fi
}

function pblib::str::upper() {
  local -r string="$1"
  shift $#

  if [[ -z $string ]]; then
    return 1
  else
    local -r lowered="${string^^}"
    printf '%s\n' "${lowered}" 
    return 0
  fi
}

function pblib::str::reverse_case() {
  local -r string="$1"
  shift $#

  if [[ -z $string ]]; then
    return 1
  else
    local -r reversed="${string~~}"
    printf '%s\n' "${reversed}"
    return 0
  fi
}

function pblib::str::strip() {
  local -r pattern="$1"
  local -r string="$2"
  shift $#
  
  if [[ -z $pattern || -z $string ]]; then
    return 1
  else
    local -r striped="${string//"${pattern}"}"
    printf '%s\n' "${striped}"
    return 0
  fi
}

function pblib::str::stripf() {
  local -r pattern="$1"
  local -r string="$2"
  shift $#

  if [[ -z $pattern || -z $string ]]; then
    return 1
  else
    local -r striped="${string/"${pattern}"}"
    printf '%s\n' "${striped}"
    return 0
  fi
}

function pblib::str::lstrip() {
  local -r pattern="$1"
  local -r string="$2"
  shift $#

  if [[ -z $pattern || -z $string ]]; then
    return 1
  else
    local -r striped="${string##"${pattern}"}"
		printf '%s\n' "${striped}"
    return 0
  fi
}

function pblib::str::rstrip() {
  local -r pattern="$1"
  local -r string="$2"
  shift $#

  if [[ -z $pattern || -z $string ]]; then
    return 1
  else
    local -r striped="${string%%"${pattern}"}"
		printf '%s\n' "${striped}"
    return 0
  fi
}

function pblib::str::trim_quotes() {
  local -r string="$1"
  shift $#

  if [[ -z $string ]]; then
    return 1
  else
    local -r trimmed_single="${string//\'}"
    local -r trimmed_double="${trimmed_single//\"}"
    printf '%s\n' "${trimmed_double}"
  fi
}

function pblib::arr::contains() {
  local -r search="$1"
  shift 1
  local -ra array=("$@")
  shift $#

  if [[ -z $search ]] || (( ${#array[@]} == 0 )); then
    return 1
  else
    for element in "${array[@]}"; do
      if [[ $element = "$search" ]]; then
        return 0
      fi
    done
    return 1
  fi
}

function pblib::arr::reverse() {
  local -ra array=("$@")
  shift $#
  local -a reversed=()

  if (( ${#array[@]} == 0 )); then
    return 1
  else
    for (( i = ${#array[@]} - 1; i >= 0; --i )); do
      reversed+=("${array[$i]}")
    done
    printf '%s\n' "${reversed[@]}"
    return 0
  fi
}

function pblib::arr::random() {
  local -ra array=("$@")
  shift $#

  if (( ${#array[@]} <= 1 )); then
    return 1
  else
    local -r element="${array[RANDOM % ${#array[@]}]}"
    printf '%s\n' "${element}"
    return 0
  fi
}

function pblib::fs::ls_recursively() {
  local -r dir="$1"
  shift $#
  local -a files=()

  if [[ ! -d $dir ]]; then
    return 1
  else
    shopt -s globstar
    for file in "$dir"/**/*; do
      files+=("${file}")
    done
    shopt -u globstar
    printf '%s\n' "${files[@]}"
    return 0
  fi
}

function pblib::fs::cat() {
  local -ra files=("$@")
  shift $#
  local file_data=''

  if (( ${#files[@]} == 0 )); then
    return 1
  else
    for file in "${files[@]}"; do
      if [[ ! -f $file ]]; then
        return 1
      else
        file_data="$(<"${file}")"
        printf '%s\n' "${file_data}"
        return 0
      fi
    done
  fi
}

function pblib::fs::head() {
  local -ri lines="$1"
  local -r file="$2"
  shift $#

  if (( lines == 0 )) || [[ ! -f $file ]]; then
    return 1
  else
    local file_data
    mapfile -tn "${lines}" file_data < "${file}"
    readonly file_data
    printf '%s\n' "${file_data[@]}"
    return 0
  fi
}

function pblib::fs::tail() {
  local -ri lines="$1"
  local -r file="$2"
  shift $#
  
  if (( lines == 0 )) || [[ ! -f $file ]]; then
    return 1
  else
    local file_data
    mapfile -t file_data < "${file}"
    readonly file_data
    local -r tail=("${file_data[@]: -$lines}")
    printf '%s\n' "${tail[@]}"
    return 0
  fi
}

function pblib::fs::lines() {
  local -r file="$1"
  shift $#

  if [[ ! -f $file ]]; then
    return 1
  else
    local file_date
    mapfile -t file_date < "${file}"
    readonly file_date
    local -ri lines_count="${#file_date[@]}"
    printf '%u\n' "${lines_count}"
    return 0
  fi
}
