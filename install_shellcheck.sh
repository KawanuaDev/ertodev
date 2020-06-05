#!/bin/bash
#
# install_shellcheck.sh
# ver 0.1.0
# Modified: 05-06-2020

. common.lib

FILE="install_shellcheck.sh"
TOPIK="Instalasi ShellCheck"

function shellcheck_distro() {
    catdistro

    if test "$CATOS" = 'debian'
    then
        f1baris
        echo -e "${LCYAN}i  ${TOPIK}:${CDEF} Sedang memasang..."
        sudo apt remove -y shellcheck && sudo apt autoremove -y
        sudo apt install -y xz-utils
        scversion="stable"
        wget -qO- "https://github.com/koalaman/shellcheck/releases/download/${scversion?}/shellcheck-${scversion?}.linux.x86_64.tar.xz" | tar -xJv
        sudo cp "shellcheck-${scversion}/shellcheck" /usr/bin/
        rm -fR shellcheck-${scversion} && f1baris
        echo -e "${LCYAN}i  ${TOPIK}:${CDEF} Cek versi terpasang..."
        shellcheck --version && f2baris
        echo -e "${LGREN}✔  ${TOPIK}:${CDEF} Selesai." && f2baris
        frmall # remove all downloaded files

    elif test "$CATOS" = 'ubuntu'
    then
        f1baris
        echo -e "${LCYAN}i  ${TOPIK}:${CDEF} Sedang memasang..."
        sudo apt remove -y shellcheck && sudo apt autoremove -y
        sudo apt install -y xz-utils
        scversion="stable"
        wget -qO- "https://github.com/koalaman/shellcheck/releases/download/${scversion?}/shellcheck-${scversion?}.linux.x86_64.tar.xz" | tar -xJv
        sudo cp "shellcheck-${scversion}/shellcheck" /usr/bin/
        rm -fR shellcheck-${scversion} && f1baris
        echo -e "${LCYAN}i  ${TOPIK}:${CDEF} Cek versi terpasang..."
        shellcheck --version && f2baris
        echo -e "${LGREN}✔  ${TOPIK}:${CDEF} Selesai." && f2baris
        frmall

    elif test "$CATOSx" = 'centos'
    then
        f1baris
        echo -e "${LCYAN}i  ${TOPIK}:${CDEF} Sedang memasang..."
        yum -y install xz
        scversion="stable"
        wget -qO- "https://github.com/koalaman/shellcheck/releases/download/${scversion?}/shellcheck-${scversion?}.linux.x86_64.tar.xz" | tar -xJv
        cp "shellcheck-${scversion}/shellcheck" /usr/bin/
        rm -fR shellcheck-${scversion} && f1baris
        echo -e "${LCYAN}i  ${TOPIK}:${CDEF} Cek versi terpasang..."
        shellcheck --version && f2baris
        echo -e "${LGREN}✔  ${TOPIK}:${CDEF} Selesai." && f2baris
        frmall # remove all downloaded files
    else
        f1baris
        echo -e "${LCYAN}[${BOT}]:${CDEF} Maaf, script ini belum mendukung OS Anda, atau sedang dalam pengembangan."
        fbye # Bye message from Cortana
        frmall # remove all downloaded files
    fi
}

shellcheck_distro