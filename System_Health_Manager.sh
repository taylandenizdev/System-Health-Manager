{\rtf1\ansi\ansicpg1254\cocoartf2867
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 #!/bin/bash\
\
echo "1. Update System"\
echo "2. Check Disk Space"\
echo "3. Clear Logs"\
echo "4. Exit"\
echo "Choose your option between (1-4)"\
read choice\
\
case $choice in\
    1)\
        echo "Updating upgradable system list"\
        apt update\
\
        echo "Upgrading all packages and system core"\
        apt full-upgrade -y\
        ;;\
    2)\
        available_disk_space=$(df / | awk 'NR>1 \{print $4\}')\
        \
        limit=1000000\
\
        if (($available_disk_space < $limit)); then\
            echo "Disk is full!"\
        else\
            echo "You have $available_disk_space KB free space"\
        fi\
        ;;\
    3)\
        echo "Deleting old log archives"\
\
        find /var/log -type f -name "*.gz" -delete\
        find /var/log -type f -name "*.[0-9]" -delete\
\
        echo "Deleting Journal logs older than 3 days"\
        journalctl --vacuum-time=3d\
\
        echo "Deleting package manager caches"\
        apt-get clean\
        apt-get autoremove -y\
\
        echo "Finished!"\
        ;;\
    4)\
        echo "Exiting ..."\
        exit 0\
        ;;\
    *)\
        echo "Invalid Choice"\
        ;;\
esac}