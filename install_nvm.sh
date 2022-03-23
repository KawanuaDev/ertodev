#!/bin/bash
#
# install_nvm.sh
# ver 0.1.0
# Modified: 23-03-2022


. common.lib

FILE="install_nvm.sh"
TOPIK="Instalasi/Update NVM"

f1baris
echo -e "${LCYAN}[${BOT}]:${CDEF} Pilih versi yang akan dipasang!"
select yn in "Latest" "Custom" "Exit"; do
    case $yn in
        Latest ) 
            echo -e "${LCYAN}i  ${TOPIK}:${CDEF} Sedang memasang..."
            wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/"${NVMLATEST}"/install.sh | bash;
            # echo -e "${LCYAN}i  ${TOPIK}:${CDEF} Memasang instruksi untuk NVM..."
            # export NVM_DIR="$HOME/.nvm"
            # [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
            # [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
            # echo -e "${LCYAN}i  ${TOPIK}:${CDEF} Cek apakah sukses terpasang..."
            # command -v nvm
            # f1baris;
            # echo -e "${LCYAN}i  ${TOPIK}:${CDEF} Cek versi terpasang..."
            # nvm --version && f2baris;
            echo -e "${LGREN}✔  ${TOPIK}:${CDEF} Selesai." && f1baris;
            echo -e "${LYELL}i  ${TOPIK}:${CDEF} Langkah selanjutnya, keluar dari console/terminal lalu masuk kembali dan ketik ${INV}nvm --version${DEV} guna mengecek versi NVM yg terpasang." && f2baris;
            frmall; # remove all downloaded files
            break;;
        Custom ) 
            echo -e "${LCYAN}i  ${TOPIK}:${CDEF} Sedang memasang..."
            echo -e "${LCYAN}»  Ketik versi yg akan dipasang? (contoh: 0.39.1 )${CDEF}" && read -r NVMPROMPT
            wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v"${NVMPROMPT}"/install.sh | bash && f1baris
            # echo -e "${LCYAN}i  ${TOPIK}:${CDEF} Memasang instruksi untuk NVM..."
            # export NVM_DIR="$HOME/.nvm"
            # [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
            # [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
            # echo -e "${LCYAN}i  ${TOPIK}:${CDEF} Cek versi terpasang..."
            # nvm --version && f2baris;
            echo -e "${LGREN}✔  ${TOPIK}:${CDEF} Selesai." && f1baris;
            echo -e "${LYELL}i  ${TOPIK}:${CDEF} Langkah selanjutnya, keluar dari console/terminal lalu masuk kembali dan ketik ${INV}nvm --version${DEV} guna mengecek versi NVM yg terpasang." && f2baris;
            frmall; # remove all downloaded files
            break;;
        Exit )
            fbye; # Bye message from Webdevis
            frmall;
            exit;;
    esac
done
# remove all downloaded files
frmall
