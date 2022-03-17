#!/bin/bash
#
# install_heroku.sh
# ver 0.1.0
# Modified: 17-03-2022


. common.lib

FILE="install_heroku.sh"
TOPIK="Instalasi Heroku CLI"

f1baris
echo -e "${LCYAN}[${BOT}]:${CDEF} Pilih package manager!"
select yn in "NPM" "Tarball" "Exit"; do
    case $yn in
        NPM ) 
            echo -e "${LCYAN}i  ${TOPIK}:${CDEF} Sedang memasang..."
            npm i -g heroku;
            echo -e "${LCYAN}i  ${TOPIK}:${CDEF} Cek versi terpasang..."
            heroku --version && f2baris;
            echo -e "${LGREN}✔  ${TOPIK}:${CDEF} Selesai." && f2baris;
            frmall; # remove all downloaded files
            break;;
        Tarball ) 
            echo -e "${LCYAN}i  ${TOPIK}:${CDEF} Sedang memasang..."
            sudo curl https://cli-assets.heroku.com/install.sh | sh;
            echo -e "${LCYAN}i  ${TOPIK}:${CDEF} Cek versi terpasang..."
            heroku --version && f2baris;
            echo -e "${LGREN}✔  ${TOPIK}:${CDEF} Selesai." && f2baris;
            frmall; # remove all downloaded files
            break;;
        Exit )
            fbye; # Bye message from Cortana
            frmall;
            exit;;
    esac
done
# remove all downloaded files
frmall
