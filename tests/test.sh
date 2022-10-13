source pblib.sh

# color tests
echo "  Regular colors"
echo -e "$color_black test text is sometimes hard to read $color_reset"
echo -e "$color_red test text is sometimes hard to read $color_reset"
echo -e "$color_green test text is sometimes hard to read $color_reset"
echo -e "$color_yellow test text is sometimes hard to read $color_reset"
echo -e "$color_blue test text is sometimes hard to read $color_reset"
echo -e "$color_purple test text is sometimes hard to read $color_reset"
echo -e "$color_cyan test text is sometimes hard to read $color_reset"
echo -e "$color_white test text is sometimes hard to read $color_reset"
echo -e "$color_reset"

echo "  High intensity colors"
echo -e "$color_black_hintensity test text is sometimes hard to read $color_reset"
echo -e "$color_red_hintensity test text is sometimes hard to read $color_reset"
echo -e "$color_green_hintensity test text is sometimes hard to read $color_reset"
echo -e "$color_yellow_hintensity test text is sometimes hard to read $color_reset"
echo -e "$color_blue_hintensity test text is sometimes hard to read $color_reset"
echo -e "$color_purple_hintensity test text is sometimes hard to read $color_reset"
echo -e "$color_cyan_hintensity test text is sometimes hard to read $color_reset"
echo -e "$color_white_hintensity test text is sometimes hard to read $color_reset"
echo -e "$color_reset"

echo "  Bold colors"
echo -e "$color_black_bold test text is sometimes hard to read $color_reset"
echo -e "$color_red_bold test text is sometimes hard to read $color_reset"
echo -e "$color_green_bold test text is sometimes hard to read $color_reset"
echo -e "$color_yellow_bold test text is sometimes hard to read $color_reset"
echo -e "$color_blue_bold test text is sometimes hard to read $color_reset"
echo -e "$color_purple_bold test text is sometimes hard to read $color_reset"
echo -e "$color_cyan_bold test text is sometimes hard to read $color_reset"
echo -e "$color_white_bold test text is sometimes hard to read $color_reset"
echo -e "$color_reset"

echo "  Bold high intensity colors"
echo -e "$color_black_bold_hintensity test text is sometimes hard to read $color_reset"
echo -e "$color_red_bold_hintensity test text is sometimes hard to read $color_reset"
echo -e "$color_green_bold_hintensity test text is sometimes hard to read $color_reset"
echo -e "$color_yellow_bold_hintensity test text is sometimes hard to read $color_reset"
echo -e "$color_blue_bold_hintensity test text is sometimes hard to read $color_reset"
echo -e "$color_purple_bold_hintensity test text is sometimes hard to read $color_reset"
echo -e "$color_cyan_bold_hintensity test text is sometimes hard to read $color_reset"
echo -e "$color_white_bold_hintensity test text is sometimes hard to read $color_reset"
echo -e "$color_reset"

echo "  Underline colors"
echo -e "$color_black_underline test text is sometimes hard to read $color_reset"
echo -e "$color_red_underline test text is sometimes hard to read $color_reset"
echo -e "$color_green_underline test text is sometimes hard to read $color_reset"
echo -e "$color_yellow_underline test text is sometimes hard to read $color_reset"
echo -e "$color_blue_underline test text is sometimes hard to read $color_reset"
echo -e "$color_purple_underline test text is sometimes hard to read $color_reset"
echo -e "$color_cyan_underline test text is sometimes hard to read $color_reset"
echo -e "$color_white_underline test text is sometimes hard to read $color_reset"
echo -e "$color_reset"

echo "  Background colors"
echo -e "$color_black_background test text is sometimes hard to read $color_reset"
echo -e "$color_red_background test text is sometimes hard to read $color_reset"
echo -e "$color_green_background test text is sometimes hard to read $color_reset"
echo -e "$color_yellow_background test text is sometimes hard to read $color_reset"
echo -e "$color_blue_background test text is sometimes hard to read $color_reset"
echo -e "$color_purple_background test text is sometimes hard to read $color_reset"
echo -e "$color_cyan_background test text is sometimes hard to read $color_reset"
echo -e "$color_white_background test text is sometimes hard to read $color_reset"
echo -e "$color_reset"

echo "  Background high intensity colors"
echo -e "$color_black_background_hintensity test text is sometimes hard to read $color_reset"
echo -e "$color_red_background_hintensity test text is sometimes hard to read $color_reset"
echo -e "$color_green_background_hintensity test text is sometimes hard to read $color_reset"
echo -e "$color_yellow_background_hintensity test text is sometimes hard to read $color_reset"
echo -e "$color_blue_background_hintensity test text is sometimes hard to read $color_reset"
echo -e "$color_purple_background_hintensity test text is sometimes hard to read $color_reset"
echo -e "$color_cyan_background_hintensity test text is sometimes hard to read $color_reset"
echo -e "$color_white_background_hintensity test text is sometimes hard to read $color_reset"
echo -e "$color_reset"

# prints tests
msg "test message for user"
err "test error for user"
warn "test warning for user"
compl "test complete for user"
echo ""

# exit tests
# in separate files)

# checks tests
food=(
  "tea"  
  "milk"
  "bread"
)

# expected
# milk is here
# code is not here
in_array "milk" ${food[@]} && echo "milk is here" || echo "milk is not here"
in_array "cofe" ${food[@]} && echo "code is here" || echo "code is not here"
