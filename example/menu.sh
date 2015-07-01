#!/bin/bash
# Bash Menu Script Example

trap 'echo;echo "Ctrl-C has been disabled"' SIGINT
trap 'echo;echo "Ctrl-Z has been disabled"' SIGTSTP
echo "#################################################"
echo "###  Cerner utility interface menu            ###"
echo "#################################################"

echo Welcome $LOGNAME!
echo
echo "$USER login from $SSH_CLIENT at `date`" >> /home/csadmin/scripts/logs/$USER-access.log

PS3="
`uptime`
You are on `hostname`. (Cerner CST non-prod server)

Please enter your choice:
"
options=("CCL(mockbc)" "SCP(mockbc)" "QCP(mockbc)" "MON_SS(mockbc)" "SPSMON(mockbc)" "vi Editor" "nmon Performance Monitor" "restricted-shell" "logout")
select opt in "${options[@]}"
do
    case $opt in
        "CCL(mockbc)")
            echo "you chose choice CCL"
            echo "$USER start running CCL from $SSH_CLIENT at `date`" >> /home/csadmin/scripts/logs/$USER-access.log
            /home/csadmin/scripts/ccl-mockbc.sh
            echo "$USER stop running CCL from $SSH_CLIENT at `date`" >> /home/csadmin/scripts/logs/$USER-access.log
            clear
            ;;
        "SCP(mockbc)")
            echo "you chose choice SCP"
            echo "$USER start running SCP from $SSH_CLIENT at `date`" >> /home/csadmin/scripts/logs/$USER-access.log
            /home/csadmin/scripts/scp-mockbc.sh
            echo "$USER stop running SCP from $SSH_CLIENT at `date`" >> /home/csadmin/scripts/logs/$USER-access.log
            clear
            ;;
        "QCP(mockbc)")
            echo "you chose choice QCP"
            echo "$USER start running QCP from $SSH_CLIENT at `date`" >> /home/csadmin/scripts/logs/$USER-access.log
            /home/csadmin/scripts/qcp-mockbc.sh
            echo "$USER stop running QCP from $SSH_CLIENT at `date`" >> /home/csadmin/scripts/logs/$USER-access.log
            clear
            ;;
        "MON_SS(mockbc)")
            echo "you chose choice MON_SS"
            echo "$USER start running MON_SS from $SSH_CLIENT at `date`" >> /home/csadmin/scripts/logs/$USER-access.log
            /home/csadmin/scripts/mon_ss-mockbc.sh
            echo "$USER stop running MON_SS from $SSH_CLIENT at `date`" >> /home/csadmin/scripts/logs/$USER-access.log
            clear
            ;;
        "SPSMON(mockbc)")
            echo "you chose choice SPSMON"
            echo "$USER start running SPSMON from $SSH_CLIENT at `date`" >> /home/csadmin/scripts/logs/$USER-access.log
            /home/csadmin/scripts/spsmon-mockbc.sh
            echo "$USER stop running SPSMON from $SSH_CLIENT at `date`" >> /home/csadmin/scripts/logs/$USER-access.log
            clear
            ;;
        "vi Editor")
            echo "you chose choice vi"
            vim -Z
            clear
            ;;
        "nmon Performance Monitor")
            echo "you chose choice top"
            nmon
            clear
            ;;
        "restricted-shell")
            echo "$USER start running SHELL from $SSH_CLIENT at `date`" >> /home/csadmin/scripts/logs/$USER-access.log
            bash -r
            echo "$USER stop running SHELL from $SSH_CLIENT at `date`" >> /home/csadmin/scripts/logs/$USER-access.log
            clear
            ;;
        "logout")
            echo "$USER logout from $SSH_CLIENT at `date`" >> /home/csadmin/scripts/logs/$USER-access.log
            exit 0
            ;;
        *)
            echo invalid option;
     esac
done
