echo "Thx for running me! Im going to do some basic ricing now!"

###Setting wallpaper

#Defining path and getting a random image from it
IMG_PATH="file:///home/aluno/Documentos/pedro-aguiar/noice/"
RND_NUMBER=$(seq 10 | shuf -n 1)
IMG=$IMG_PATH"w"$RND_NUMBER".jpg"

#Setting the image
gsettings set org.gnome.desktop.background picture-uri ${IMG}
echo "Wallpaper seted to w$RND_NUMBER.jpg :)"


###Setting the theme
cd faded-dream-cinnamon-theme/  || git clone https://github.com/aaron-dev-git/faded-dream-cinnamon-theme.git | cd faded-dream-cinnamon-theme/ 
cp -r "Faded Dream"/ ~/.themes/

gsettings set org.cinnamon.theme name 'Faded Dream'
gsettings set org.cinnamon.desktop.wm.preferences theme 'Faded Dream'
gsettings set org.cinnamon.desktop.interface clock-show-date true

echo "The theme was setted to Faded Dream"

###Choose icon color
COLOR="`convert $IMG -resize 1x1 txt:- | grep -Po "[[:xdigit:]]{6}" `"

r_hex=${COLOR:0:2}
g_hex=${COLOR:2:2}
b_hex=${COLOR:4:2}

# Convert hex to decimal
red=$((16#${r_hex}))
green=$((16#${g_hex}))
blue=$((16#${b_hex}))


# Determine which variable is bigger
if (( red > green && red > blue )); then
    ICON='Mint-Y-Dark-Orange'
elif (( green > red && green > blue )); then
    ICON='Mint-Y-Dark'
else
    ICON='Mint-Y-Dark-Blue'
fi

gsettings set org.cinnamon.desktop.interface icon-theme $ICON


###Setting terminal theme
id=$(gsettings get org.gnome.Terminal.ProfilesList default | tr -d "'")
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$id/ visible-name 'Default'

cd gnome-terminal || git clone https://github.com/dracula/gnome-terminal | cd gnome-terminal
./install.sh -s Dracula -p Default --skip-dircolors

echo "Dracula theme installed for the Gnome Terminal"

gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$id/ background-transparency-percent 10

gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$id/ use-theme-transparency false

gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$id/ use-transparent-background true
echo "Transparency of terminal bg setted to 10%"
