# project: pblib
# author: ssleert

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
  ## Usage: msg "message for user" "addition for message"
  if [[ -z $1 ]]; then
    return 1
  fi

  local message="$1"
  shift 1
  local addons=("$@")
  shift $#

  echo -e "$color_blue_bold::$color_white_bold $message$color_reset"
  for addon in "${addons[@]}"; do
    echo -e "$color_blue_bold |$color_white_bold $addon$color_reset"
  done

  return 0
}

