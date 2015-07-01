#!/bin/bash
# A menu driven shell script sample template
## ----------------------------------
# Step #1: Define variables
# ----------------------------------
EDITOR=vim
PASSWD=/etc/passwd
RED='\033[0;41;30m'
STD='\033[0;0;39m'

# ----------------------------------
# Step #2: User defined function
# ----------------------------------
pause(){
  read -p "Press [Enter] key to continue..." fackEnterKey
}

# do something in one()
one(){
        echo "you chose choice CCL"
        echo "$USER start running CCL from $SSH_CLIENT at `date`" >> /home/csadmin/scripts/logs/$USER-access.log
        /home/csadmin/scripts/ccl-mockbc.sh
        echo "$USER stop running CCL from $SSH_CLIENT at `date`" >> /home/csadmin/scripts/logs/$USER-access.log
        clear
}

# do something in two()
two(){
        echo "you chose choice SCP"
        echo "$USER start running SCP from $SSH_CLIENT at `date`" >> /home/csadmin/scripts/logs/$USER-access.log
        /home/csadmin/scripts/scp-mockbc.sh
        echo "$USER stop running SCP from $SSH_CLIENT at `date`" >> /home/csadmin/scripts/logs/$USER-access.log
        clear
}

# do something in three()
three(){
        echo "you chose choice QCP"
        echo "$USER start running QCP from $SSH_CLIENT at `date`" >> /home/csadmin/scripts/logs/$USER-access.log
        /home/csadmin/scripts/qcp-mockbc.sh
        echo "$USER stop running QCP from $SSH_CLIENT at `date`" >> /home/csadmin/scripts/logs/$USER-access.log
        clear
}

# do something in four()
four(){
        echo "you chose choice MON_SS"
        echo "$USER start running MON_SS from $SSH_CLIENT at `date`" >> /home/csadmin/scripts/logs/$USER-access.log
        /home/csadmin/scripts/mon_ss-mockbc.sh
        echo "$USER stop running MON_SS from $SSH_CLIENT at `date`" >> /home/csadmin/scripts/logs/$USER-access.log
        clear
}

# do something in five()
five(){
        echo "you chose choice SPSMON"
        echo "$USER start running SPSMON from $SSH_CLIENT at `date`" >> /home/csadmin/scripts/logs/$USER-access.log
        /home/csadmin/scripts/spsmon-mockbc.sh
        echo "$USER stop running SPSMON from $SSH_CLIENT at `date`" >> /home/csadmin/scripts/logs/$USER-access.log
        clear
}

# do something in six()
six(){
        echo "you chose choice 6"
        echo "$USER start running MSGVIEW from $SSH_CLIENT at `date`" >> /home/csadmin/scripts/logs/$USER-access.log
        /home/csadmin/scripts/msgview-mockbc.sh
        echo "$USER stop running MSGVIEW from $SSH_CLIENT at `date`" >> /home/csadmin/scripts/logs/$USER-access.log
        clear
}

# do something in seven()
seven(){
        echo "you chose choice 7"
#        echo "$USER start running MC from $SSH_CLIENT at `date`" >> /home/csadmin/scripts/logs/$USER-access.log
#        mc /cerner/d_mockbc/log
#        echo "$USER stop running MC from $SSH_CLIENT at `date`" >> /home/csadmin/scripts/logs/$USER-access.log
        clear
}

# do something in eight()
eight(){
        echo "$USER start running SHELL from $SSH_CLIENT at `date`" >> /home/csadmin/scripts/logs/$USER-access.log
        echo "You are under restricted mode."
        sudo -u s_$USER -H /usr/bin/lshell --config /home/csadmin/scripts/etc/mockbc-lshell.conf
        pause
#       lshell --config /home/csadmin/scripts/etc/mockbc-lshell.conf
        echo "$USER stop running SHELL from $SSH_CLIENT at `date`" >> /home/csadmin/scripts/logs/$USER-access.log
        clear
}

# do something in nine()
nine(){
        echo "nine() called"
        echo "$USER return to main menu from $SSH_CLIENT at `date`" >> /home/csadmin/scripts/logs/$USER-access.log
        exit 0
}

# function to display menus
show_menus() {
        clear
        echo "Welcome $LOGNAME!"
        echo
        echo "`uptime`"
        echo "You are on `hostname`. (Cerner CST non-prod server)"
        echo
        echo "#################################################"
        echo "###  Cerner CST utility interface menu        ###"
        echo "#################################################"
        echo "1. CCL(mockbc)"
        echo "2. SCP(mockbc)"
        echo "3. QCP(mockbc)"
        echo "4. MON_SS(mockbc)"
        echo "5. SPSMON(mockbc)"
        echo "6. MSGVIEW(mockbc)"
        echo "7. "
        echo "8. secured-shell"
        echo "9. Return to Main Menu"
        echo
        echo


}
# read input from the keyboard and take a action
# invoke the one() when the user select 1 from the menu option.
# invoke the two() when the user select 2 from the menu option.
# Exit when user the user select 3 form the menu option.
read_options(){
        local choice
        read -p "Enter choice [ 1 - 9 ] " choice
        case $choice in
                1) one ;;
                2) two ;;
                3) three ;;
                4) four ;;
                5) five ;;
                6) six ;;
                7) seven ;;
                8) eight ;;
                9) nine ;;
                *) echo -e "${RED}Wrong Selection${STD}" && sleep 1
        esac
}

# ----------------------------------------------
# Step #3: Trap CTRL+C, CTRL+Z and quit singles
# ----------------------------------------------
trap 'echo;echo "Ctrl-C has been disabled"' SIGINT
trap 'echo;echo "Ctrl-Z has been disabled"' SIGTSTP
trap 'echo;echo "Ctrl-D has been disabled"' SIGQSTP

# -----------------------------------
# Step #4: Main logic - infinite loop
# ------------------------------------
while true
do
        show_menus
        read_options
done
