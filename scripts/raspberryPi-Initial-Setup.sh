#!/usr/bin/bash

# === raspberryPi-Initial-Setup.sh ===
# Bash script to set up the Raspberry Pi after fresh install and install commanly / useful cli tools 

# === CREDITS ===
# Leaf ascii art: https://www.deviantart.com/pigeonsnatcher/art/Ascii-art-leaf-954408024
# Ascii art text: https://patorjk.com/software/taag/#p=display&f=Calvin%20S&t=src-leaf

# === INSTALLED tools ===
# htop          --  https://github.com/htop-dev/htop
# neofetch      --  https://github.com/dylanaraps/neofetch
# tmux          --  https://github.com/tmux/tmux 
# timeshfit     --  https://github.com/teejee2008/timeshift
# fuzzy finder  --  https://github.com/junegunn/fzf


#Colors / Formating 
ORANGE1="\033[38;5;208m" 
ORANGE2="\033[38;5;209m"
ORANGE3="\033[38;5;210m"
ORANGE4="\033[38;5;211m"
RED="\e[31m"
GREEN="\e[32m"
DIM="\e[2m"
RESET="\033[0m"

#Conditions
cond_info="${RESET}[ ${DIM}i${RESET} ]"
cond_pass="${RESET}[ ${GREEN}✔${RESET} ]"
cond_fail="${RESET}[ ${RED}✖${RESET} ]"



# Menu
clear
echo -e "${ORANGE1}""    ,"
echo -e "${ORANGE1}"'  ."|".     '"${RESET}"'┌─┐┬─┐┌─┐   ┬  ┌─┐┌─┐┌─┐'
echo -e "${ORANGE2}"" / \|/ \    ""${RESET}""└─┐├┬┘│  ───│  ├┤ ├─┤├┤ "
echo -e "${ORANGE2}""|\  |  /|   ""${RESET}""└─┘┴└─└─┘   ┴─┘└─┘┴ ┴└  "
echo -e "${ORANGE3}""| '.|.' |   ""${RESET}""----------------------- "
echo -e "${ORANGE3}"' "._|_."    '"${RESET}"" └ " "${RED}raspberryPi" "${RESET}Initial Setup" "${DIM}V1.0.0" "${RESET}"
echo -e "${ORANGE4}""    |""${RESET}"
echo ""

echo -e "${ORANGE1}"$USER"${ORANGE2}@""${ORANGE3}"$HOSTNAME"${RESET}"


#Housekeeping
run_command() {
    local cmd="$1"
    local description="$2"

    echo -n -e " └ ${cond_info} ${description}"
    $cmd >/dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo -e "\r └ ${cond_pass} ${description} successful${reset}"
    else
        echo -e "\r └ ${cond_fail} ${description} FAILED${reset}"
    fi
}

run_command "sudo apt-get update" "apt-get: update"
run_command "sudo apt-get upgrade -y" "apt-get: upgrade"
run_command "sudo apt-get autoremove -y" "apt-get: autoremove"
run_command "sudo apt-get clean -y" "apt-get: clean"

run_command "sudo apt-get install htop -y" "Installing: htop"
run_command "sudo apt-get install neofetch -y" "Installing: Neofetch"
run_command "sudo apt-get install tmux -y" "Installing: tmux"
run_command "sudo apt-get install timeshift -y" "Installing: timeshift"
run_command "sudo apt-get install fzf" "Installing: fuzzy finder"