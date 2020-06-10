#!/bin/bash
#
# install_github.sh
# ver 0.1.0
# Modified: 10-06-2020

. common.lib

FILE="install_github.sh"
TOPIK="Instalasi Github CLI"

function check_arch() {
    os_name=$(uname -s | tr '[:upper:]' '[:lower:]')
    if [ "$os_name" = "linux" ]; then
        arch=$(uname -m | tr '[:upper:]' '[:lower:]')
        if echo "$arch" | grep -q 'x86_64'
        then
            platform="linux_amd64"

        elif echo "$arch" | grep -q -E '(x86)|(i686)'
        then
            platform="linux_386"

        else
            echo -e "${LRED}×  Architecture Linux belum didukung: ${arch}. Instalasi dihentikan.${CDEF}";
            exit 1
        fi
    else
        echo -e "${LRED}×  Platform Linux belum didukung: ${os_name}. Instalasi dihentikan.${CDEF}";
        exit 1
    fi

    file_name="Github_CLI"
}

function github_distro() {
    catdistro

    if test "$CATOS" = 'ubuntu'
    then
        check_arch
        echo -e "${LCYAN}i  ${TOPIK}:${CDEF} Platform yang digunakan adalah ${platform}"
        echo -e "${LCYAN}i  ${TOPIK}:${CDEF} Mengunduh versi terbaru."

        if curl -s https://api.github.com/repos/cli/cli/releases/latest \
        | grep  browser_download_url \
        | grep ${platform}.deb \
        | cut -d '"' -f 4 \
        | wget -i - && mv gh_*.deb ${file_name}.deb && f1baris
        then
            echo -e "${LCYAN}i  ${TOPIK}:${CDEF} Memasang GIT."
            sudo apt install -y git && f1baris
            echo -e "${LCYAN}i  ${TOPIK}:${CDEF} Mengekstrak file."
            sudo dpkg -i ${file_name}.deb && f1baris
            echo -e "${LCYAN}i  ${TOPIK}:${CDEF} Verifikasi versi terpasang."
            gh --version && rm -fR ${file_name}.deb && f1baris
            echo -e "${LGREN}✔  ${TOPIK}:${CDEF} Selesai."
        
        else
            echo -e "${LRED}×  Pengunduhan gagal. Mohon cek kembali koneksi internet. Instalasi dihentikan.${CDEF}";
            exit 1
        fi

        frmall # remove all downloaded files

    elif test "$CATOSx" = 'centos'
    then
        check_arch
        echo -e "${LCYAN}i  ${TOPIK}:${CDEF} Platform yang digunakan adalah ${platform}"
        echo -e "${LCYAN}i  ${TOPIK}:${CDEF} Mengunduh versi terbaru."

        if curl -s https://api.github.com/repos/cli/cli/releases/latest \
        | grep  browser_download_url \
        | grep ${platform}.rpm \
        | cut -d '"' -f 4 \
        | wget -i - && mv gh_*.rpm ${file_name}.rpm && f1baris
        then
            echo -e "${LCYAN}i  ${TOPIK}:${CDEF} Mohon menunggu..."
            sudo yum localinstall -y ${file_name}.rpm && f1baris
            echo -e "${LCYAN}i  ${TOPIK}:${CDEF} Verifikasi versi terpasang."
            gh --version && rm -fR ${file_name}.rpm && f1baris
            echo -e "${LGREN}✔  ${TOPIK}:${CDEF} Selesai."
        
        else
            echo -e "${LRED}×  Pengunduhan gagal. Mohon cek kembali koneksi internet. Instalasi dihentikan.${CDEF}";
            exit 1
        fi

        frmall # remove all downloaded files
    else
        f1baris
        echo -e "${LCYAN}[${BOT}]:${CDEF} Maaf, script ini belum mendukung OS Anda, atau sedang dalam pengembangan."
        fbye # Bye message from Cortana
        frmall # remove all downloaded files
    fi
}

github_distro