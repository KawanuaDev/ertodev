#!/bin/bash
#
# install_vercel.sh
# ver 0.1.0
# Modified: 05-06-2020


. common.lib

FILE="install_vercel.sh"
TOPIK="Instalasi Vercel CLI"

f1baris
echo -e "${LCYAN}[${BOT}]:${CDEF} Pilih package manager!"
select yn in "NPM" "YARN" "Exit"; do
    case $yn in
        NPM ) 
            echo -e "${LCYAN}i  ${TOPIK}:${CDEF} Sedang memasang..."
            npm i -g vercel;
            echo -e "${LCYAN}i  ${TOPIK}:${CDEF} Cek versi terpasang..."
            vercel --version && f2baris;
            echo -e "${LGREN}✔  ${TOPIK}:${CDEF} Selesai." && f2baris;
            frmall; # remove all downloaded files
            break;;
        YARN ) 
            echo -e "${LCYAN}i  ${TOPIK}:${CDEF} Sedang memasang..."
            yarn global add vercel;
            echo -e "${LCYAN}i  ${TOPIK}:${CDEF} Cek versi terpasang..."
            vercel --version && f2baris;
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
