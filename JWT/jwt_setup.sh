#!/bin/bash
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
CYAN=$(tput setaf 6)
BRIGHT=$(tput bold)
NORMAL=$(tput sgr0)

printf "\n%s" "Download your ${BRIGHT}jwt${NORMAL} user code by clicking here:"
printf "\nhttps://project-assistant.udacity.com/auth_tokens/new \n"
printf "\n%s" "You may need to ${BRIGHT}navigate to the link a second time${NORMAL} after logging in for the file to automatically download."
printf "\n%s" "Once you've downloaded your ${BRIGHT}jwt${NORMAL}, copy the contents into: ${CYAN}${BRIGHT}/home/workspace/JWT/jwt${NORMAL}."
printf "\n%s" "You can then submit your project by entering ${BRIGHT}submit${NORMAL} into the commandline."
printf "\n"

