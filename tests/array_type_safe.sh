function get_array {
  local -a array_local=("$@")

  for i in ${array_local[@]}; do
    echo -e "$i\n"
  done
}

IFS=$'\n' 
declare -a array_global=($(get_array 'a s d 1' 'a s d 2' 'a s d 3'))
unset IFS

for i in "${array_global[2]}"; do
  echo "$i"
done
