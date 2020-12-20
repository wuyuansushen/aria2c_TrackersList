bash ~/aria2c_TrackersList/TLUpdate.sh
cp ~/aria2c_TrackersList/TLUpdate.sh /usr/lib/ && echo "[+]Move script to /usr/lib/ successfully !" || echo "[-]Move is failed"
((crontab -l ; echo "0 4 */2 * * bash /usr/lib/TLUpdate.sh" ) | crontab ) && echo "[+]Add script to crontab successfully, It has removed the git floder successfully !!" || echo "[-]Add script is failed"
rm -r ~/aria2c_TrackersList
