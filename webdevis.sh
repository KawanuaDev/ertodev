#!/bin/bash
#
# webdevis.sh
# ver 0.2.1
# Modified: 23-03-2022

. common.lib

prechk && clear
VER=$(curl -s ${CDN}/versi.json | grep "Stable" | cut -d '"' -f 4)
FILE="webdevis.sh"

## Start Header ##
flogo
echo -e "» VERSI: ${INV} ${VER} ${DEF}" && f1baris
echo -e "» URL: ${CDN}" && f2baris
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
f1baris
## End Header ##

function wsl_distro() {
    catdistro

    if test "$CATOS" = 'ubuntu'
    then
        WSLU="preinstall_wsl_ubn.sh"
        fwget "${WSLU} -O ${WSLU}"; 
        fchmodx "${WSLU}" && ./${WSLU}; 
        frmfile;

    elif test "$CATOSx" = 'centos'
    then
        WSLC="preinstall_wsl_cent.sh"
        fwget "${WSLC} -O ${WSLC}"; 
        fchmodx "${WSLC}" && ./${WSLC}; 
        frmfile;

    else
        f1baris
        echo -e "${LCYAN}[${BOT}]:${CDEF} Maaf, script ini belum mendukung distro Anda, atau sedang dalam pengembangan."
        fbye # Bye message from Cortana
        frmall # remove all downloaded files
    fi
}
function gcloud_distro() {
    catdistro

    if test "$CATOS" = 'ubuntu'
    then
        GCLIU="install_gcloud_ubn.sh"
        fwget "${GCLIU} -O ${GCLIU}"; 
        fchmodx "${GCLIU}" && ./${GCLIU}; 
        frmfile;

    elif test "$CATOS" = 'debian'
    then
        GCLID="install_gcloud_ubn.sh"
        fwget "${GCLID} -O ${GCLID}"; 
        fchmodx "${GCLID}" && ./${GCLID}; 
        frmfile;

    elif test "$CATOSx" = 'centos'
    then
        GCLIC="install_gcloud_cent.sh"
        fwget "${GCLIC} -O ${GCLIC}"; 
        fchmodx "${GCLIC}" && ./${GCLIC}; 
        frmfile;

    else
        f1baris
        echo -e "${LCYAN}[${BOT}]:${CDEF} Maaf, script ini belum mendukung distro Anda, atau sedang dalam pengembangan."
        fbye # Bye message from Cortana
        frmall # remove all downloaded files
    fi
}

echo -e "${CDEF}"
echo -e "${LCYAN}[${BOT}]:${CDEF} Halo $USER, ada yang bisa dibantu?"
select yn in "Setup awal VM baru..."\
 "Konfigurasi WSL baru..."\
 "Install/Update HUGO Extended"\
 "Install gcloud CLI (Debian, Ubuntu)"\
 "Install ibmcloud CLI"\
 "Install/Update Firebase CLI"\
 "Install NGINX Certbot (Debian, Ubuntu)"\
 "Install/Update GIT"\
 "Install ASCIINEMA"\
 "Install/Update Node Version Manager (NVM)"\
 "Install Node.js + NPM"\
 "Install YARN"\
 "Install Deno.js"\
 "Install HEXO"\
 "Install Vercel CLI"\
 "Install Netlify CLI"\
 "Install Github CLI"\
 "Install Heroku CLI"\
 "Install Cloudflare Wrangler"\
 "Install ShellCheck"\
 "CLIMYID... (in English)"\
 "Nanti dulu."; do
    
    case $yn in
        "Setup awal VM baru..." )
            FVM="preinstall_vm.sh"
            fwget "${FVM} -O ${FVM}"; 
            fchmodx "${FVM}" && ./${FVM}; 
            frmfile;
            break;;
        "Konfigurasi WSL baru..." )
            wsl_distro;
            break;;
        "Install/Update HUGO Extended" )
            FHUGO="install_hugoext.sh"
            fwget "${FHUGO} -O ${FHUGO}"; 
            fchmodx "${FHUGO}" && ./${FHUGO}; 
            frmfile;
            break;;
        "Install gcloud CLI (Debian, Ubuntu)" )
            gcloud_distro;
            break;;
        "Install ibmcloud CLI" )
            f1baris;
            curl -fsSL https://clis.cloud.ibm.com/install/linux | sh;
            frmall; 
            break;;
        # "Install ibmcloud CLI" )
        #     FIBM="install_ibmcloud.sh"
        #     fwget "${FIBM} -O ${FIBM}"; 
        #     fchmodx "${FIBM}" && ./${FIBM}; 
        #     frmfile;
        #     break;;
        "Install/Update Firebase CLI" )
            FBASE="install_firebase.sh"
            fwget "${FBASE} -O ${FBASE}"; 
            fchmodx "${FBASE}" && ./${FBASE}; 
            frmfile;
            break;;
        "Install NGINX Certbot (Debian, Ubuntu)" )
            FCERT="install_certbot_nginx.sh"
            fwget "${FCERT} -O ${FCERT}"; 
            fchmodx "${FCERT}" && ./${FCERT}; 
            frmfile;
            break;;
        "Install/Update GIT" )
            FGIT="install_git.sh"
            fwget "${FGIT} -O ${FGIT}"; 
            fchmodx "${FGIT}" && ./${FGIT}; 
            frmfile;
            break;;
        "Install ASCIINEMA" )
            FASCII="install_asciinema.sh"
            fwget "${FASCII} -O ${FASCII}"; 
            fchmodx "${FASCII}" && ./${FASCII}; 
            frmfile;
            break;;
        "Install/Update Node Version Manager (NVM)" )
            FNVM="install_nvm.sh"
            fwget "${FNVM} -O ${FNVM}"; 
            fchmodx "${FNVM}" && ./${FNVM}; 
            frmfile;
            break;;
        # "Install/Update Node Version Manager (NVM)" )
        #     NVER="v0.39.1"
        #     wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/${NVER}/install.sh | bash; 
        #     frmall; 
        #     break;;
        "Install Node.js + NPM" )
            FNODE="install_nodejs.sh"
            fwget "${FNODE} -O ${FNODE}"; 
            fchmodx "${FNODE}" && ./${FNODE}; 
            frmfile;
            break;;
        "Install YARN" )
            FYARN="install_yarn.sh"
            fwget "${FYARN} -O ${FYARN}"; 
            fchmodx "${FYARN}" && ./${FYARN}; 
            frmfile;
            break;;
        "Install Deno.js" )
            f1baris;
            curl -fsSL https://deno.land/x/install/install.sh | sh; 
            frmall; 
            break;;
        "Install HEXO" )
            f1baris;
            npm install -g hexo; 
            frmall; 
            break;;
        "Install Vercel CLI" )
            FVERCL="install_vercel.sh"
            fwget "${FVERCL} -O ${FVERCL}"; 
            fchmodx "${FVERCL}" && ./${FVERCL}; 
            frmfile;
            break;;
        "Install Netlify CLI" )
            f1baris;
            npm install netlify-cli -g; 
            frmall; 
            break;;
        "Install Github CLI" )
            FGITHB="install_github.sh"
            fwget "${FGITHB} -O ${FGITHB}"; 
            fchmodx "${FGITHB}" && ./${FGITHB}; 
            frmfile;
            break;;
        "Install Heroku CLI" )
            FHERO="install_heroku.sh"
            fwget "${FHERO} -O ${FHERO}"; 
            fchmodx "${FHERO}" && ./${FHERO}; 
            frmfile;
            break;;
        "Install Cloudflare Wrangler" )
            FWRANG="install_wrangler.sh"
            fwget "${FWRANG} -O ${FWRANG}"; 
            fchmodx "${FWRANG}" && ./${FWRANG}; 
            frmfile;
            break;;
        "Install ShellCheck" )
            FSHLCHK="install_shellcheck.sh"
            fwget "${FSHLCHK} -O ${FSHLCHK}"; 
            fchmodx "${FSHLCHK}" && ./${FSHLCHK}; 
            frmfile;
            break;;
        "CLIMYID... (in English)" )
            frmall;
            wget https://cli.my.id/run.sh && bash run.sh;
            frmfile;  # remove THIS file
            exit;;
        "Nanti dulu." )
            fbye; # Bye message from Cortana
            frmall;
            exit;;
    esac
done
