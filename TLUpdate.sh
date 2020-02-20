#!/bin/bash
SourceURL='https://github.com/ngosang/trackerslist.git'
TmpStr=${SourceURL%.git} 
FloderName=${TmpStr##*/}
FileName='trackers_best.txt'
FullName="/tmp/${FloderName}/${FileName}"
#Test aria2
aria2c --version
if [ $? == 0 ];then
	echo "[+]Aria2 have installed"
else
	echo "[-]Aria2 is not installed"
	apt update
	apt install aria2 -y
	echo '[-]Have installed Aira2'
fi
#Aria2 floder
if [ -d $HOME/.aria2 ]; then 
	echo "[+].aria2 folder is exited"
else
	echo "[-].aria2 folder is not exited,Prepare to Install Aira2 and create this floder"
	mkdir $HOME/.aria2
	echo "[-]Have created directory .aria2"
fi
#Test TrackersList Floder
echo "[+]Check TrackerList floder....."
cd /tmp
if [ -d /tmp/${FloderName} ];then
	echo "[+]The TrackerList have existed.Remove it...."
	rm -r /tmp/trackerslist
	echo "[+]Remove the floder successfully!"
else
	echo "[-]The floder(git) is not existed!"
fi
#Check for git
git
if [ $? == 1 ];then
	echo "[+]git have installed"
else
	echo "[-]git is not installed"
	apt install git -y
	echo '[-]Install git successfully'
fi
echo "[+]Download TrackersList...."
#Download txt Source File
git clone ${SourceURL}
echo "[+]Download success!"
#Find old Output File
if [ -f /tmp/aria2.conf ]; then 
	echo "[-]/tmp/aria2.conf is exited"
	rm /tmp/aria2.conf
else
	echo "[+]/tmp/aria2.conf is not exist"
fi
#Generate output
RealOut=$(echo $(grep . ${FullName}) | sed 's/ /,/g')
echo "bt-tracker=${RealOut}" > /tmp/aria2.conf
#Aria2 old File Test
if [ -f $HOME/.aria2/aria2.conf ]; then 
	echo "[+]$HOME/.aria2/aria2.conf  is exited"
	rm $HOME/.aria2/aria2.conf
else
	echo "[-]$HOME/.aria2/aria2.conf  is not exited"
fi
#Aria2 new File movement
echo "[+]Move aria2.conf file"
mv /tmp/aria2.conf $HOME/.aria2/aria2.conf
echo "[+]Move the file successfully"
#Remove used git repository
rm -r /tmp/${FloderName}
echo "[+]Clean up the rubbish file successfully!"
cd ~
exit
