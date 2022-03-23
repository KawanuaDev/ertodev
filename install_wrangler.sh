#!/bin/bash
#
# install_wrangler.sh
# ver 0.1.1
# Modified: 22-03-2022


. common.lib

FILE="install_wrangler.sh"
TOPIK="Instalasi Cloudflare Wrangler"

f1baris
echo -e "${LCYAN}[${BOT}]:${CDEF} Pilih package manager!"
select yn in "NPM" "Exit"; do
    case $yn in
        NPM ) 
            echo -e "${LCYAN}i  ${TOPIK}:${CDEF} Sedang memasang..."
            npm i @cloudflare/wrangler -g;
            echo -e "${LCYAN}i  ${TOPIK}:${CDEF} Cek versi terpasang..."
            wrangler --version && f2baris;
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
