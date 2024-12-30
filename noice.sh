echo "Thanks for running me! I'm going to do some basic ricing now!"

### Setting wallpaper

# Defining path and getting a random image from it
IMG_PATH="/home/aluno/Documentos/pedro-aguiar/noice/"
IMG=$(find "${IMG_PATH}" -type f -name 'w*.jpg' | shuf -n 1)

# Setting the image
gsettings set org.gnome.desktop.background picture-uri "${IMG}"
echo "Wallpaper set to $(basename ${IMG}) :)"

### Setting the theme
THEME_DIR="$HOME/.themes/Faded Dream"
if [ ! -d "$THEME_DIR" ]; then
    git clone https://github.com/aaron-dev-git/faded-dream-cinnamon-theme.git /tmp/faded-dream-cinnamon-theme
    cp -r /tmp/faded-dream-cinnamon-theme/"Faded Dream" "$HOME/.themes/"
    rm -rf /tmp/faded-dream-cinnamon-theme
fi

gsettings set org.cinnamon.theme name 'Faded Dream'
gsettings set org.cinnamon.desktop.wm.preferences theme 'Faded Dream'
gsettings set org.cinnamon.desktop.interface clock-show-date true

echo "The theme was set to Faded Dream"

### Choose icon color
COLOR=$(convert "$IMG" -resize 1x1 txt:- | grep -Po "[[:xdigit:]]{6}")

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

gsettings set org.cinnamon.desktop.interface icon-theme "${ICON}"
echo "Icon theme set to ${ICON}"