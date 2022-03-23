#!/bin/bash
#
# install_nodejs.sh
# ver 0.2.0
# Modified: 23-03-2022

. common.lib

FILE="install_nodejs.sh"
TOPIK="Instalasi Node.js + NPM"

function node_distro() {
    catdistro

    if test "$CATOS" = 'debian'
    then
        echo -e "${LCYAN}»  Ketik versi yg akan diunduh? (pilihan: 12, 13, 14 )${CDEF}" && read -r NODEJS
        sudo apt install -y curl
        sudo curl -sL https://deb.nodesource.com/setup_"${NODEJS}".x | sudo -E bash - && f1baris
        echo -e "${LCYAN}i  ${TOPIK}:${CDEF} Sedang memasang."
        sudo apt install nodejs -y
        echo -e "${LCYAN}i  ${TOPIK}:${CDEF} Cek versi."
        node --version && f1baris
        echo -e "${LGREN}✔  ${TOPIK}:${CDEF} Selesai." && f2baris
        fselesai && f2baris
        frmall # remove all downloaded files

    elif test "$CATOS" = 'ubuntu'
    then
        echo -e "${LCYAN}»  Ketik versi yg akan diunduh? (pilihan: 12, 13, 14 )${CDEF}" && read -r NODEJS
        sudo curl -sL https://deb.nodesource.com/setup_"${NODEJS}".x | sudo -E bash - && f1baris
        echo -e "${LCYAN}i  ${TOPIK}:${CDEF} Sedang memasang."
        sudo apt install nodejs -y
        echo -e "${LCYAN}i  ${TOPIK}:${CDEF} Cek versi."
        node --version && f1baris
        echo -e "${LGREN}✔  ${TOPIK}:${CDEF} Selesai." && f2baris
        fselesai && f2baris
        frmall # remove all downloaded files

    elif test "$CATOSx" = 'centos'
    then
        echo -e "${LCYAN}»  Ketik versi yg akan diunduh? (pilihan: 12, 13, 14 )${CDEF}" && read -r NODEJS
        sudo curl --silent --location https://rpm.nodesource.com/setup_"${NODEJS}".x | sudo bash - && f1baris
        echo -e "${LCYAN}i  ${TOPIK}:${CDEF} Sedang memasang."
        sudo yum install nodejs -y
        echo -e "${LCYAN}i  ${TOPIK}:${CDEF} Cek versi."
        node --version && f1baris
        echo -e "${LGREN}✔  ${TOPIK}:${CDEF} Selesai." && f2baris
        fselesai && f2baris
        frmall # remove all downloaded files
    else
        f1baris
        echo -e "${LCYAN}[${BOT}]:${CDEF} Maaf, script ini belum mendukung OS Anda, atau sedang dalam pengembangan."
        fbye # Bye message from Cortana
        frmall # remove all downloaded files
    fi
}

function nodecheck() {
    ## Check Node.js if exist
    if [ -f /usr/bin/node ]; then
        echo -e "${LGREN}✔  ${TOPIK}:${CDEF} Node.js sudah terpasang. Berikut adalah versi yang ada."
        node --version && f2baris;
        frmall; # remove all downloaded files
        exit;;
    fi
}

function nvmcheck() {
    ## Check NVM if exist
    if [ ! -f /usr/bin/nvm ]; then
        echo -e "${LRED}i  ${TOPIK}:${CDEF} NVM belum terpasang. Instalasi NVM versi terbaru dimulai..."
        wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/"${NVMLATEST}"/install.sh | bash;
        echo -e "${LGREN}✔  ${TOPIK}:${CDEF} Selesai." && f1baris;
        echo -e "${LYELL}i  ${TOPIK}:${CDEF} Langkah selanjutnya, keluar dari console/terminal lalu masuk kembali dan ketik ${INV}nvm --version${DEV} guna mengecek versi NVM yg terpasang. Jika sudah, lanjutkan lagi instalasi Node.js" && f2baris;
        frmall; # remove all downloaded files
    fi
}

f1baris
nodecheck
echo -e "${LCYAN}[${BOT}]:${CDEF} Pilihan instalasi Node"
select yn in "NVM" "Repository" "Exit"; do
    case $yn in
        NVM ) 
            echo -e "${LCYAN}i  ${TOPIK}:${CDEF} Cek keberadaan NVM."
            nvmcheck
            echo -e "${LCYAN}»  Ketik versi yg akan diunduh? (contoh: 13.10.1, 14, atau ketik ${INV}node${DEV} untuk versi terbaru)${CDEF}" && read -r NODEPROMPT
            nvm install ${NODEPROMPT} && f1baris;
            echo -e "${LGREN}✔  ${TOPIK}:${CDEF} Selesai." && f2baris;
            frmall; # remove all downloaded files
            break;;
        Repository ) 
            node_distro
            break;;
        Exit )
            fbye; # Bye message from Webdevis
            frmall;
            exit;;
    esac
done
# remove all downloaded files
frmall
