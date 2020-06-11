#!/bin/bash
#
# install_git.sh
# ver 0.2.0
# Modified: 10-06-2020

. common.lib

FILE="install_git.sh"
TOPIK="Instalasi GIT"

function git_distro() {
    catdistro

    if test "$CATOS" = 'debian'
    then
        echo -e "${LCYAN}i  ${TOPIK}:${CDEF} Pemasangan git. Mohon menunggu."
        sudo apt install -y git && git --version && f1baris
        echo -e "${LCYAN}i  ${TOPIK}:${CDEF} Konfigurasi awal."
        read -rp "Tulis nama untuk aktifitas commit: " GITNAME
        read -rp "Tulis email untuk aktifitas commit: " GITEMAIL
        git config --global user.name "${GITNAME}"
        git config --global user.email "${GITEMAIL}"
        git config --global color.ui auto
        echo -e "${LGREN}✔  ${TOPIK}:${CDEF} Selesai." && f2baris
        fselesai && f2baris
        frmall # remove all downloaded files

    elif test "$CATOS" = 'ubuntu'
    then
        echo -e "${LCYAN}i  ${TOPIK}:${CDEF} Menambahkan repository."
        sudo add-apt-repository ppa:git-core/ppa && f1baris
        echo -e "${LCYAN}i  ${TOPIK}:${CDEF} Pemasangan git. Mohon menunggu."
        sudo apt update -y
        sudo apt install -y git && git --version
        echo -e "${LCYAN}i  ${TOPIK}:${CDEF} Konfigurasi awal."
        read -rp "Tulis nama untuk aktifitas commit: " GITNAME
        read -rp "Tulis email untuk aktifitas commit: " GITEMAIL
        git config --global user.name "${GITNAME}"
        git config --global user.email "${GITEMAIL}"
        git config --global color.ui auto
        echo -e "${LGREN}✔  ${TOPIK}:${CDEF} Selesai." && f2baris
        fselesai && f2baris
        frmall # remove all downloaded files

    elif test "$CATOSx" = 'centos'
    then
        echo -e "${LCYAN}i  ${TOPIK}:${CDEF} Menghapus git versi lama."
        sudo yum remove -y git*
        echo -e "${LCYAN}i  ${TOPIK}:${CDEF} Mengunduh package yang dibutuhkan."
        wget "${CDN}"/repo/wandisco-git.repo -O /etc/yum.repos.d/wandisco-git.repo
        sudo rpm --import http://opensource.wandisco.com/RPM-GPG-KEY-WANdisco && f1baris
        echo -e "${LCYAN}i  ${TOPIK}:${CDEF} Pemasangan git. Mohon menunggu."
        sudo yum install -y git && git --version
        echo -e "${LCYAN}i  ${TOPIK}:${CDEF} Konfigurasi awal."
        read -rp "Tulis nama untuk aktifitas commit: " GITNAME
        read -rp "Tulis email untuk aktifitas commit: " GITEMAIL
        git config --global user.name "${GITNAME}"
        git config --global user.email "${GITEMAIL}"
        git config --global color.ui auto
        echo -e "${LGREN}✔  ${TOPIK}:${CDEF} Selesai." && f2baris
        fselesai && f2baris
        frmall
    else
        f1baris
        echo -e "${LCYAN}[${BOT}]:${CDEF} Maaf, script ini belum mendukung OS Anda, atau sedang dalam pengembangan."
        fbye # Bye message from Cortana
        frmall # remove all downloaded files
    fi
}

git_distro