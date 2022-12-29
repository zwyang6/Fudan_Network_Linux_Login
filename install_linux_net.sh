#!bin/bash 

echo "unzipping..."
unzip ./linux_client.zip -d ~/Documents
echo "unzipping file to ~/Documents done"

mv ~/Documents/linux_client/.auth-setting ~ 

chmod a+x ~/Documents/linux_client/auth-client

echo "please enter your Student ID"
read id

echo "please enter the password of your Student Account $id" 
read password

if [ "$SHELL" = "/bin/bash" ];then
       	echo "#>>>>>>>campus net configure<<<<<<<<"	
	echo "alias onnet='cd ~/Documents/linux_client  && ./auth-client -u $id -p $password auth'" >> ~/.bashrc
	echo "alias offnet='cd ~/Documents/linux_client  && ./auth-client -u $id auth --logout'" >> ~/.bashrc
       	source ~/.bashrc	
elif [ "$SHELL" = "/bin/zsh" ];then
	echo "#>>>>>>>campus net configure<<<<<<<<"
	echo "alias onnet='cd ~/Documents/linux_client  && ./auth-client -u $id -p $password auth'" >> ~/.zshrc
        echo "alias offnet='cd ~/Documents/linux_client  && ./auth-client -u $id auth --logout'" >> ~/.zshrc
	source ~/.zshrc
fi

echo "configuration is done!\n"
echo ">>>>>>>>usage<<<<<<<<<"
echo "Enter onnet  to login"
echo "Enter offnet to logout"
