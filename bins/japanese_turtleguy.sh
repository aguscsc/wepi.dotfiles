#!/bin/bash
# --- Color Codes ---
# You can change the color by replacing '32m' with another code.
# Common colors: 31m=Red, 32m=Green, 33m=Yellow, 34m=Blue, 35m=Magenta, 36m=Cyan
GREEN='\e[32m'
RESET='\e[0m' # This resets the color back to default
# Array of Japanese phrases with their Romaji pronunciation and English meaning.
# You can add or remove phrases here to customize your experience.
phrases=(
    "頑張ってください (がんばって)"
    "今日の調子はどう？ (ちょうし)"
    "一日頑張ろう！ (がんばろう)"
    "ファイト！"
    "夢を追いかけろ (おいかけろ)"
    "お疲れ様です (おつかれさま)"
    "いつでも心に太陽を (たいよう)"
    "七転び八起き (ななころびやおき)"
    "継続は力なり (けいぞく)"
)

# Get the total number of phrases in the array.
num_phrases=${#phrases[@]}

# Generate a random index number.
random_index=$((RANDOM % num_phrases))

# Get the randomly selected phrase.
selected_phrase="${phrases[$random_index]}"

# Display the speech bubble with the phrase.
# The `printf` command is used for better formatting.
echo
printf " %s\n" "------------------------------------"
printf "< %-6s >\n" "$selected_phrase"
printf " %s\n" "------------------------------------"
echo

# Display the Yotsuba ASCII art using a 'cat' heredoc.
# This preserves the formatting and special characters of the art.
printf "${GREEN}"
cat << "EOF"
⠀⠀⠀⠀⠀⠀⠀⠀⠀⡠⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠘⠦⠼⠃⠀⠀⠀⠀⡠⠖⠚⠒⢦⡀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣼⡫⡤⠀⠀⡤⡧⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⢀⣠⠔⠊⣉⣭⣶⣶⣷⣶⣦⡀⠀⢀⡴⠋⠀⠀⣠⠴⢤⡀
⠀⠀⠀⠀⠀⠸⠥⢟⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⡰⠋⠀⠀⠀⠀⣇⠶⣧⠇
⠀⠀⠀⠀⠀⢀⣴⣿⣿⣿⣿⣟⣿⣟⣿⣽⣿⣿⡧⡄⠀⠀⠀⠀⠈⠉⠁⠀
⠠⠦⢠⠖⠂⣾⣿⣿⣿⣿⣻⣷⢿⢿⣿⣿⣿⣿⠇⠙⣆⠀⠀⠀⠀⠀⠀⠀
⠀⣔⠳⣂⡤⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡋⠀⠀⢻⠀⠀⠀⠀⠀⠀⠀
⠀⠈⠉⣁⠀⠀⠛⠿⣿⣿⣿⣿⣿⡿⠿⠃⣸⠏⠃⢀⡯⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⣰⠊⠉⠉⠀⡜⠀⠀⠰⡗⣋⢀⡾⠁⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠰⣇⡶⡀⠆⣰⠏⠀⠀⠘⣧⡵⠛⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠙⠚⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
EOF
printf "${RESET}"
