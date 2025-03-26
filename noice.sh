FLAG_WALLPAPER_ONLY=0 #Flag para apenas randomizar o wallpaper e definir ícones

while getopts "w" opt; do
  case ${opt} in
    w )
      FLAG_WALLPAPER_ONLY=1
      ;;
    \? )
      echo "Opção inválida, execute sem paramêtros ou apenas com -w" >&2
      exit 1
      ;;
  esac
done

echo " "
echo " _   _         _              ___  ___ _         _   "
echo "| \ | |       (_)             |  \/  |(_)       | |  "
echo "|  \| |  ___   _   ___  ___   | .  . | _  _ __  | |_ "
echo "| .   | / _ \ | | / __|/ _ \  | |\/| || || '_ \ | __|"
echo "| |\  || (_) || || (__|  __/  | |  | || || | | || |_ "
echo "\_| \_/ \___/ |_| \___|\___|  \_|  |_/|_||_| |_| \__|"
echo " "

## Wallpaper e Ícones
if ((FLAG_WALLPAPER_ONLY==0)); then
    echo "<>Thx for running me! Im going to do some basic ricing rn!<>"
    echo " "
else
    echo "<>Wallpaper randomization in progress...<>"
    echo " "
fi

# Wallpaper
IMG_PATH="./wallpapers/"
{
    cd $IMG_PATH 2> /dev/null
} || {
    echo "<>Creating /wallpapers folder..." 
    echo "... please fill it up and run the script again<>"
    mkdir wallpapers
    sleep 2
    cd $IMG_PATH
    echo " "
}

FILES=(*)
FILES_QTD=${#FILES[@]}
if ((FILES_QTD >= 1)); then
    RND_NUMBER=$(seq $((FILES_QTD-1)) | shuf -n 1)
    IMG=${FILES[$RND_NUMBER]}
    IMG_DIR=file://$(realpath $IMG)
    gsettings set org.gnome.desktop.background picture-uri ${IMG_DIR}
    sleep 1
    echo "Wallpaper seted to ${FILES[$RND_NUMBER]} :)"
    echo " "
else
    echo "<>No wallpapers found in ./wallpapers/"
    echo "Please insert at least two images in the folder.<>"
    echo " "
    echo "<>Oh btw, if you need some wallpapers check the readme.md file<>"
    sleep 1
fi
cd ..

# Ícones
echo "<>Setting the Icons based on ${FILES[$RND_NUMBER]}...<>"
echo " "

SYSTEM_VERSION=$(lsb_release -s -r | tail -n 1 | grep -Po "^(\d*)")
if ((SYSTEM_VERSION < 22)); then
    echo "<>You are in mint $SYSTEM_VERSION and may not have..."
    echo " ...the Yaru icons, lets fix that<>!"
    if ls | grep yaru; then
        echo " "
        echo "<>Yaru already cloned<>"
    else
        echo " "
        git clone https://github.com/ubuntu/yaru.git &&
        sleep 1
    fi
    cp -r ./yaru/icons/* ~/.icons/ 2>/dev/null
    echo " "
fi

if dpkg -s imagemagick &> /dev/null; then
    cd $IMG_PATH

    COLOR="`convert ./$IMG -resize 1x1 txt:- | grep -Po "[[:xdigit:]]{6}" `"
    cd ..

    r_hex=${COLOR:0:2}
    g_hex=${COLOR:2:2}
    b_hex=${COLOR:4:2}

    red=$((16#${r_hex}))
    green=$((16#${g_hex}))
    blue=$((16#${b_hex}))


    if (( red > green && red > blue )); then
        ICON='Yaru'
    elif (( green > red && green > blue )); then
        ICON='Yaru-olive'
    else
        ICON='Yaru-blue'
    fi

    if (((red < blue || red - blue > 0 && red - blue < 20) && blue > green && red > green)); then
        ICON='Yaru-purple-dark'
    fi
    
else
    ICON='Yaru-purple-dark'
fi

gsettings set org.cinnamon.desktop.interface icon-theme $ICON

echo "<>Icons setted to ${ICON} !<>"
echo " "

if dpkg -s ulauncher &> /dev/null; then
    killall ulauncher 2>/dev/null
    env GDK_BACKEND=x11 /usr/bin/ulauncher --hide-window & 2>/dev/null
    echo "<>Ulauncher rebooted<>"
    echo " "
fi

## Tema e Terminais
if ((FLAG_WALLPAPER_ONLY==0)); then
    # Tema
    echo " "

    {
        cd faded-dream-cinnamon-theme/ 2> /dev/null
    } || {
        git clone https://github.com/aaron-dev-git/faded-dream-cinnamon-theme.git && 
        sleep 1
        cd faded-dream-cinnamon-theme/ 
        echo " "
    }
    cp -r "Faded Dream"/ ~/.themes/
    cd ..

    gsettings set org.cinnamon.theme name 'Faded Dream'
    gsettings set org.cinnamon.desktop.interface gtk-theme 'Faded Dream'
    gsettings set org.cinnamon.desktop.wm.preferences theme 'Faded Dream'
    gsettings set org.cinnamon.desktop.interface clock-show-date true

    echo "<>The theme setted to Faded Dream<>"
    echo " "

    # Terminais
    id=$(gsettings get org.gnome.Terminal.ProfilesList default | tr -d "'")
    gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$id/ visible-name 'Default'
    {
        cd gnome-terminal 2> /dev/null
    } || {
        git clone https://github.com/dracula/gnome-terminal &&
        sleep 1
        cd gnome-terminal
        echo " "
    }
    ./install.sh -s Dracula -p Default --skip-dircolors 2>/dev/null
    cd ..

    echo "<>Dracula theme installed for the Gnome Terminal<>"
    echo " "

    if command -v alacritty &>/dev/null; then
        mkdir ~/.config/alacritty 2>/dev/null
        cp ./alacritty/alacritty.toml ~/.config/alacritty 2>/dev/null
        alacritty -e bash -c 'echo "<>Dracula theme installed for the Alacritty Terminal<>"; echo " "; exec bash' &
        echo "<>Dracula theme installed for the Alacritty Terminal<>"
        echo " "
    fi

    gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$id/ background-transparency-percent 10

    gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$id/ use-theme-transparency false

    gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$id/ use-transparent-background true

    echo "<>Opacity of terminal setted to 90%<>"
echo " "
fi
echo "______                      _ "
echo "|  _  \                    | |"
echo "| | | | ___   _ __    ___  | |"
echo "| | | |/ _ \ | '_ \  / _ \ | |"
echo "| |/ /| (_) || | | ||  __/ |_|"
echo "|___/  \___/ |_| |_| \___| (_)"
echo " "
sleep 1

