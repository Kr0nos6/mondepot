#!/bin/bash

#introduction
echo -e "\t _____ _____ ______ ___________ _____  ______  ___   _____ _   _ "
echo -e "\t/  ___/  __ \| ___ \_   _| ___ \_   _| | ___ \/ _ \ /  ___| | | |"
echo -e "\t\ '--.| /  \/| |_/ / | | | |_/ / | |   | |_/ / /_\ \\ '--.| |_| |"
echo -e "\t '--. \ |    |    /  | | |  __/  | |   | ___ \  _  | '--. \  _  |"
echo -e "\t/\__/ / \__/\| |\ \ _| |_| |     | |   | |_/ / | | |/\__/ / | | |"
echo -e "\t\____/ \____/\_| \_|\___/\_|     \_/   \____/\_| |_/\____/\_| |_/"
echo -e "\t                                                                 "
echo -e "\t                                                                 "
echo -e "\t  ___  ______ _________________   ___________ _____              "
echo -e "\t / _ \ |  ___|  _  | ___ \ ___ \ |  ___| ___ \  ___|             "
echo -e "\t/ /_\ \| |_  | | | | |_/ / |_/ / | |__ | |_/ / |__               "
echo -e "\t|  _  ||  _| | | | |    /|  __/  |  __||    /|  __|              "
echo -e "\t| | | || |   \ \_/ / |\ \| |     | |___| |\ \| |___              "
echo -e "\t\_| |_/\_|    \___/\_| \_\_|     \____/\_| \_\____/            \n"

#fonction informations systeme
function systemfunc () {
echo -e "$HOSTNAME\n"
echo -e "$(uname -a)\n"
echo -e "$(free -h)\n"
echo -e "$(ip a)\n"
echo -e "$(service --status-all)\n"
echo -e "$(cat /proc/cpuinfo)\n"
echo -e "$(cat /etc/passwd)\n"
echo -e "$(cat /etc/group)\n"
echo -e "$(lspci)\n"
}


#menu, skip si argument
        if [ -z "$1" ]; then
                echo -e "Que voulez-vous faire ?"
                echo -e "1:informations systeme\t2:processus en cours\t3:"
                read clavier
        fi

#informations systeme
        if [ "$clavier" == "1" ] || [ "$1" == "1" ]; then
		systemfunc | tee sysinfo.txt | more
	fi
#afficher les processus et les trier
	if [ "$clavier" == "2" ] || [ "$1" == "2" ]; then
		ps -aux > ps.txt
		awk '{print $11}' ps.txt | sed 's/\[//g' | sed 's/\]//g' | sed -e 's/\<COMMAND\>//g' | sort | more
	fi
#GET ipinfo API
        if [ "$clavier" == "6" ] || [ "$1" == "6" ]; then
                echo -e "Entrez une ip publique\n"
                read ip
                curl -X GET "https://ipinfo.io/$ip"
        fi
