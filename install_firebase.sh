#!/bin/bash
#
# install_firebase.sh
# ver 0.1.0
# Modified: 17-03-2022


. common.lib

FILE="install_firebase.sh"
TOPIK="Instalasi Firebase CLI"

f1baris
echo -e "${LCYAN}[${BOT}]:${CDEF} Pilihan:"
select yn in "Install" "Update" "Exit"; do
    case $yn in
        # Install ) 
        #     echo -e "${LCYAN}i  ${TOPIK}:${CDEF} Sedang memasang..."
        #     sudo npm install -g firebase-tools;
        #     echo -e "${LCYAN}i  ${TOPIK}:${CDEF} Cek versi terpasang..."
        #     firebase --version && f2baris;
        #     echo -e "${LGREN}✔  ${TOPIK}:${CDEF} Selesai." && f2baris;
        #     frmall; # remove all downloaded files
        #     break;;
        Install ) 
            echo -e "${LCYAN}i  ${TOPIK}:${CDEF} Sedang memasang..."
            sudo curl -sL https://firebase.tools | bash;
            echo -e "${LCYAN}i  ${TOPIK}:${CDEF} Cek versi terpasang..."
            firebase --version && f2baris;
            echo -e "${LGREN}✔  ${TOPIK}:${CDEF} Selesai." && f2baris;
            frmall; # remove all downloaded files
            break;;
        Update ) 
            echo -e "${LCYAN}i  ${TOPIK}:${CDEF} Sedang memasang..."
            sudo curl -sL https://firebase.tools | upgrade=true bash;
            echo -e "${LCYAN}i  ${TOPIK}:${CDEF} Cek versi terpasang..."
            firebase --version && f2baris;
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
