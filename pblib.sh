#!/usr/bin/env bash
#
# pblib - pure bash lib
# author: ssleert
# link: https://github.com/ssleert/pblib

declare -xr CLR_RESET='\033[0m'
 
declare -xr CLR_BLACK='\033[0;30m'
declare -xr CLR_RED='\033[0;31m'
declare -xr CLR_GREEN='\033[0;32m'
declare -xr CLR_YELLOW='\033[0;33m'
declare -xr CLR_BLUE='\033[0;34m'
declare -xr CLR_PURPLE='\033[0;35m'
declare -xr CLR_CYAN='\033[0;36m'
declare -xr CLR_WHITE='\033[0;37m'

declare -xr CLR_BLACK_HINTENSITY='\033[0;90m'
declare -xr CLR_RED_HINTENSITY='\033[0;91m'
declare -xr CLR_GREEN_HINTENSITY='\033[0;92m'
declare -xr CLR_YELLOW_HINTENSITY='\033[0;93m'
declare -xr CLR_BLUE_HINTENSITY='\033[0;94m'
declare -xr CLR_PURPLE_HINTENSITY='\033[0;95m'
declare -xr CLR_CYAN_HINTENSITY='\033[0;96m'
declare -xr CLR_WHITE_HINTENSITY='\033[0;97m'

declare -xr CLR_BLACK_BOLD='\033[1;30m'
declare -xr CLR_RED_BOLD='\033[1;31m'
declare -xr CLR_GREEN_BOLD='\033[1;32m'
declare -xr CLR_YELLOW_BOLD='\033[1;33m'
declare -xr CLR_BLUE_BOLD='\033[1;34m'
declare -xr CLR_PURPLE_BOLD='\033[1;35m'
declare -xr CLR_CYAN_BOLD='\033[1;36m'
declare -xr CLR_WHITE_BOLD='\033[1;37m'

declare -xr CLR_BLACK_BOLD_HINTENSITY='\033[1;90m'
declare -xr CLR_RED_BOLD_HINTENSITY='\033[1;91m'
declare -xr CLR_GREEN_BOLD_HINTENSITY='\033[1;92m'
declare -xr CLR_YELLOW_BOLD_HINTENSITY='\033[1;93m'
declare -xr CLR_BLUE_BOLD_HINTENSITY='\033[1;94m'
declare -xr CLR_PURPLE_BOLD_HINTENSITY='\033[1;95m'
declare -xr CLR_CYAN_BOLD_HINTENSITY='\033[1;96m'
declare -xr CLR_WHITE_BOLD_HINTENSITY='\033[1;97m'

declare -xr CLR_BLACK_UNDERLINE='\033[4;30m'
declare -xr CLR_RED_UNDERLINE='\033[4;31m'
declare -xr CLR_GREEN_UNDERLINE='\033[4;32m'
declare -xr CLR_YELLOW_UNDERLINE='\033[4;33m'
declare -xr CLR_BLUE_UNDERLINE='\033[4;34m'
declare -xr CLR_PURPLE_UNDERLINE='\033[4;35m'
declare -xr CLR_CYAN_UNDERLINE='\033[4;36m'
declare -xr CLR_WHITE_UNDERLINE='\033[4;37m'

declare -xr CLR_BLACK_BACKGROUND='\033[40m'
declare -xr CLR_RED_BACKGROUND='\033[41m'
declare -xr CLR_GREEN_BACKGROUND='\033[42m'
declare -xr CLR_YELLOW_BACKGROUND='\033[43m'
declare -xr CLR_BLUE_BACKGROUND='\033[44m'
declare -xr CLR_PURPLE_BACKGROUND='\033[45m'
declare -xr CLR_CYAN_BACKGROUND='\033[46m'
declare -xr CLR_WHITE_BACKGROUND='\033[47m'

declare -xr CLR_BLACK_BACKGROUND_HINTENSITY='\033[0;100m'
declare -xr CLR_RED_BACKGROUND_HINTENSITY='\033[0;101m'
declare -xr CLR_GREEN_BACKGROUND_HINTENSITY='\033[0;102m'
declare -xr CLR_YELLOW_BACKGROUND_HINTENSITY='\033[0;103m'
declare -xr CLR_BLUE_BACKGROUND_HINTENSITY='\033[0;104m'
declare -xr CLR_PURPLE_BACKGROUND_HINTENSITY='\033[0;105m'
declare -xr CLR_CYAN_BACKGROUND_HINTENSITY='\033[0;106m'
declare -xr CLR_WHITE_BACKGROUND_HINTENSITY='\033[0;107m'

function pblib::test::test_compl() {
  local -r compl_status="$1"
  shift $#

  if [[ $compl_status = false ]]; then
    printf "[ %s() ${CLR_RED_BOLD}failed${CLR_RESET} ]\n" "${FUNCNAME[1]}"
    return 1
  else
    printf "[ %s() ${CLR_GREEN_BOLD}completed${CLR_RESET} ]\n" "${FUNCNAME[1]}"
    return 0
  fi
}

function pblib::io::msg() {
  local -r messages=("$@")
  shift $#

  if [[ -z ${messages[0]} || -z ${messages[-1]} ]]; then
    return 1
  else
    printf "${CLR_BLUE_BOLD}::${CLR_WHITE_BOLD} %s${CLR_RESET}\n" "${messages[0]}"
    for message in "${messages[@]:1}"; do
      printf "${CLR_BLUE_BOLD} |${CLR_WHITE_BOLD} %s${CLR_RESET}\n" "${message}"
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
    printf "${CLR_GREEN_BOLD}>>>${CLR_WHITE_BOLD} %s${CLR_RESET}\n" "${messages[0]}"
    for message in "${messages[@]:1}"; do
      printf "${CLR_GREEN_BOLD}  |${CLR_WHITE_BOLD} %s${CLR_RESET}\n" "${message}"
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
    printf "${CLR_RED_BOLD}error: ${CLR_WHITE_BOLD}on %u line in %s of %s() func\n     ${CLR_RED_BOLD}|${CLR_RESET}\n" "${BASH_LINENO[0]}" "${BASH_SOURCE[1]}" "${FUNCNAME[1]}" >&2
    for message in "${messages[@]}"; do
      printf "     ${CLR_RED_BOLD}|${CLR_RESET} %s\n" "${message}" >&2
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
    printf "${CLR_YELLOW_BOLD}warning:${CLR_WHITE_BOLD} on %u line in %s of %s() func\n       ${CLR_YELLOW_BOLD}|${CLR_RESET}\n" "${BASH_LINENO[0]}" "${BASH_SOURCE[1]}" "${FUNCNAME[1]}" >&2
    for warning in "${messages[@]}"; do
      printf "${CLR_YELLOW_BOLD}       |${CLR_RESET} %s\n" "${warning}" >&2
    done
    return 0
  fi
}

function pblib::die() {
  local -ir exit_code="$1"
  shift 1
  local -r messages=("$@")
  shift $(( $# - 1 ))

  if (( exit_code <= 0 )) || (( exit_code > 255 )); then
    exit 1
  elif [[ -z ${messages[0]} || -z ${messages[-1]} ]]; then
    exit "${exit_code}"
  else
    printf "${CLR_RED_BOLD}error: ${CLR_WHITE_BOLD}on %u line in %s of %s() func\n     ${CLR_RED_BOLD}|${CLR_RESET}\n" "${BASH_LINENO[0]}" "${BASH_SOURCE[1]}" "${FUNCNAME[1]}" >&2
    for message in "${messages[@]}"; do
      printf "     ${CLR_RED_BOLD}|${CLR_RESET} %s\n" "${message}" >&2
    done
    
    exit "${exit_code}"
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
    local -r uppered="${string^^}"
    printf '%s\n' "${uppered}"
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

function pblib::str::fstrip() {
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
    return 0
  fi
}

function pblib::str::regex() {
  local -r string="$1"
  local -r regex="$2"
  shift $#

  if [[ -z $string || -z $regex ]]; then
    return 1
  else
    [[ $string =~ $regex ]]
    if (( $? == 0 )); then
      return 0
    else
      return 1
    fi
  fi
}

function pblib::str::trim() {
  local -r string="$1"
  shift $#

  if [[ -z $string ]]; then
    return 1
  else
    local -r trimmed_left="${string#"${string%%[![:space:]]*}"}"
    local -r trimmed_right="${trimmed_left%"${trimmed_left##*[![:space:]]}"}"
    printf '%s\n' "${trimmed_right}"
    return 0
  fi
}

function pblib::str::2arr() {
  local -r string="$1"
  shift $#

  if [[ -z $string ]]; then
    return 1
  else
    local -a array
    local char
    for (( i = 0; i < ${#string}; ++i )); do
      char="${string:${i}:1}"
      if [[ -z $char ]]; then
        array+=(' ')
      else
        array+=("${char}")
      fi
    done
    unset char
    readonly array
    printf '%s\n' "${array[@]}"
    return 0
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

  if (( ${#array[@]} == 0 )); then
    return 1
  else
    local -a reversed
    for (( i = ${#array[@]} - 1; i >= 0; --i )); do
      reversed+=("${array[$i]}")
    done
    readonly reversed
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
  local -a files

  if [[ ! -d $dir ]]; then
    return 1
  else
    shopt -s globstar
    for file in "${dir}"/**/*; do
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

  if (( ${#files[@]} == 0 )); then
    return 1
  else
    for file in "${files[@]}"; do
      if [[ ! -f $file ]]; then
        return 1
      else
        local -r file_data="$(<"${file}")"
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
    local file_data
    mapfile -t file_data < "${file}"
    readonly file_data
    local -ri lines_count="${#file_data[@]}"
    printf '%u\n' "${lines_count}"
    return 0
  fi
}

function pblib::fs::lines_while() {
  local -r file="$1"
  shift $#

  if [[ ! -f $file ]]; then
    return 1
  else
    local -i lines_count=0
    while IFS='' read -r _; do
      ((++lines_count))
    done < "${file}"
    readonly lines_count
    printf '%u\n' "${lines_count}"
    return 0
  fi
}

function pblib::fs::touch() {
  local -r file="$1"
  shift $#

  if [[ -z $file ]]; then
    return 1
  else
    :>"${file}"
    if (( $? != 0 )); then
      return 1
    else
      return 0
    fi
  fi
}

function pblib::fs::basename() {
  local -r file="$1"
  local -r suffix="$2"
  shift $#

  if [[ -z $file ]]; then
    return 1
  else
    local -r basename_no_path="${file%"${##*[!/]}"}"
    local -r basename="${basename_no_path##*/}"
    local -r basename_no_suffix="${basename%"${suffix/$basename}"}"
		printf '%s\n' "${basename_no_suffix}"
    return 0
  fi
}

function pblib::fs::count() {
  local -ri elements_count="$#"

  if (( elements_count == 0 )); then
    return 1
  else
    printf '%u\n' "${elements_count}"
  fi
}

declare -xri PBLIB_LOADED=1
