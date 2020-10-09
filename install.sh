#!/bin/bash
BIGreen='\033[1;92m'
NC='\033[0m'
homeDirectory=$(echo $HOME)

echo -e "${BIGreen}Updating package list: ${NC}"
sudo apt-get update

sleep .5
echo -e "${BIGreen}Installing i3-gaps: ${NC}"
sudo apt install -y i3-gaps

sleep .5
echo -e "${BIGreen}Installing rofi: ${NC}"
sudo apt install -y rofi

sleep .5
echo -e "${BIGreen}Installing nitrogen: ${NC}"
sudo apt install -y nitrogen

sleep .5
echo -e "${BIGreen}Configuring i3-gaps... ${NC}"

if [ -d $homeDirectory"/.config/i3/" ] 
then
    echo "Directory "$homeDirectory"/.config/autostart exists."    
	cp ./config $homeDirectory/.config/i3/
else
    echo "Warning: Directory" $homeDirectory" /.config/autostart does not exists. Creating a new one..."
    mkdir -p $homeDirectory/.config/i3
    cp ./config $homeDirectory/.config/i3/
fi

echo -e "${BIGreen}Putting i3 and nitrogen to autostart... ${NC}"
if [ -d $homeDirectory"/.config/autostart" ] 
then
    echo "Directory "$homeDirectory"/.config/autostart  exists."    
	cp ./i3.desktop $homeDirectory/.config/autostart
	cp ./nitrogen.desktop $homeDirectory/.config/autostart
else
    echo "Warning: Directory" $homeDirectory "/.config/autostart does not exists. Creating a new one..."
    mkdir -p $homeDirectory/.config/autostart
    cp ./i3.desktop $homeDirectory/.config/autostart
	cp ./nitrogen.desktop $homeDirectory/.config/autostart
fi


sleep .5
echo -e "${BIGreen}Coloring root... ${NC}"
sudo cp $homeDirectory/.bashrc /root/

#echo -e "${BIGreen}On Current session tab change xfwm4 and xfdesktop Restart style to Never and click Save Session ${NC}"
#xfce4-session-settings &
