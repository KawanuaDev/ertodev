#!/bin/bash
#
# install_hugoext.sh
# ver 0.2.1
# Modified: 23-09-2022

. common.lib

FILE="install_hugoext.sh"
TOPIK="Instalasi HUGO Extended"

function hugo_distro() {
    catdistro

    if test "$CATOS" = 'ubuntu'
    then
        echo -e "${LCYAN}i  ${TOPIK}:${CDEF} Mengunduh versi terbaru."
        curl -s https://api.github.com/repos/gohugoio/hugo/releases/latest \
        | grep  browser_download_url \
        | grep linux-amd64.deb \
        | grep extended \
        | cut -d '"' -f 4 \
        | wget -i -
        f1baris
        echo -e "${LCYAN}i  ${TOPIK}:${CDEF} Mengekstrak file."
        sudo dpkg -i hugo*_Linux-64bit.deb && f1baris
        echo -e "${LCYAN}i  ${TOPIK}:${CDEF} Verifikasi versi terpasang."
        hugo version && rm -fR *.deb && f1baris
        echo -e "${LGREN}✔  ${TOPIK}:${CDEF} Selesai."
        frmall # remove all downloaded files

    if test "$CATOS" = 'debian'
    then
        echo -e "${LCYAN}i  ${TOPIK}:${CDEF} Mengunduh versi terbaru."
        curl -s https://api.github.com/repos/gohugoio/hugo/releases/latest \
        | grep  browser_download_url \
        | grep linux-amd64.deb \
        | grep extended \
        | cut -d '"' -f 4 \
        | wget -i -
        f1baris
        echo -e "${LCYAN}i  ${TOPIK}:${CDEF} Mengekstrak file."
        sudo dpkg -i hugo*_Linux-64bit.deb && f1baris
        echo -e "${LCYAN}i  ${TOPIK}:${CDEF} Verifikasi versi terpasang."
        hugo version && rm -fR *.deb && f1baris
        echo -e "${LGREN}✔  ${TOPIK}:${CDEF} Selesai."
        frmall # remove all downloaded files

    elif test "$CATOSx" = 'centos'
    then
        echo -e "${LCYAN}i  ${TOPIK}..${CDEF}"
        wget https://copr.fedorainfracloud.org/coprs/daftaupe/hugo/repo/epel-7/daftaupe-hugo-epel-7.repo -O /etc/yum.repos.d/hugo.repo
        sudo yum update -y
        sudo yum install hugo -y && f1baris
        echo -e "${LCYAN}i  ${TOPIK}:${CDEF} Verifikasi versi terpasang."
        hugo version && rm -fR *.deb && f1baris
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

hugo_distro