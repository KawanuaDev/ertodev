#!/bin/bash
#
# run.sh
# ver 0.1.2
# Modified: 17-03-2022

FILE="run.sh"
CDEF="\e[39m"
LCYAN="\e[96m"
LRED="\e[91m"

# Pre-check
fdistrochk() {
    TITLE="${LCYAN}i  Pre-check:${CDEF}"
    osdebn=$(grep -w ID /etc/os-release | cut -d '=' -f 2)
    osrhel=$(grep -w ID /etc/os-release | cut -d '"' -f 2)

    if [[ "$osdebn" = 'ubuntu' ]]
    then
        PKG="apt"

    elif [[ "$osdebn" = 'debian' ]]
    then
        PKG="apt"

    elif [[ "$osrhel" = 'centos' ]]
    then
        PKG="yum"

    elif [[ "$osrhel" = 'fedora' ]]
    then
        PKG="yum"

    else
        printf "\n"
        echo -e "${LRED}Sorry, your Distro is not supported yet. Exiting now.${CDEF}"
        echo -e "${LCYAN}See you later.${CDEF}" # Bye message from Cortana
        rm -fR $FILE # remove all downloaded files
    fi
}
fdistrochk

## Check dependecies if exist
if [ ! -f /usr/bin/curl ]; then
    echo "${TITLE} CURL not found. Installing..."
    ${PKG} -y -q install curl
fi

## Fetching required files to run
sudo wget -q https://cortana.web.app/common.lib
sudo wget -q https://cortana.web.app/ertodev.sh
sudo chmod +x ertodev.sh
./ertodev.sh