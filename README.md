# Noice Mint 🎨

Este script faz algumas personalizações básicas no seu desktop Linux Mint, como:

- Definir um wallpaper aleatório que esteja dentro da pasta `./wallpapers` 
- Aplicar o tema Faded Dream 
- Escolhe um ícone baseado na cor predominante do wallpaper <u>(Funciona apenas no Mint 21 ou mais antigo)</u>.
- Aplicar o tema Dracula no Terminal (Compatível com `Gnome Terminal` e `Alacritty`)

Fiz ele especificamente para o Linux Mint, pois os computadores da minha faculdade atual perdem a configuração se rebootados. 

## Como usar 🚀

1. **Clone o repositório:**
    ```sh
    git clone https://github.com/duxpe/noice_mint.git
    ```

2. **Entre na pasta:**
    ```sh
    cd noice_mint/
    ```

 3. **Coloque seus Wallpapers na pasta `./wallpapers/`:**

    Caso precise, baixe um pack pronto de wallpapers aqui:
    - [Drive com alguns Wallpapers (1200+)](https://drive.google.com/drive/folders/1G1pNnEjjxD0TK8AbD9YDL7QGirw2RxqT?usp=sharing)
    - [Drive com menos Wallpapers e com comprensão de imagem (72)](https://drive.google.com/drive/folders/1277HLoLBYSN4nrad76z_lJ3k-H4VvD8f?usp=sharing)

4. **Execute o script:**
    ```sh
    bash ./noice.sh
    ```

### Bônus:
 
 **Para apenas Randomizar o wallpaper execute o script:**
 ```sh
 bash ./noice.sh -w
 ```

## Requisitos 📋

- `Cinnamon DE` (Ou outra DE que possua gsettings iguais a do Cinnamon)
- `ImageMagick convert` (Vem por padrão no Mint 21 ou anterior, no 22 o ícone `Yaru-purple-dark` será usado)
- `Wallpapers na pasta ./wallpaper`
- `Gnome Terminal` (Padrão do Mint Cinnamon) ou `Alacritty`
- `realpath` (Está no coreutils padrão do gnu/linux, mas se não tiver você vai precisar editar `IMG_DIR` manualmente)

Todos esses requisitos estão geralmente presentes no Mint.

## Notas 📝

1. **Sistemas em que foi testado**:
   1. Linux Mint 22.1 (Cinnamon)
   2. Linux Mint 21.3 (Cinnamon)
   
2. Sempre leia scripts antes de executar.

3. Sinta-se livre para modificar ou sugerir melhorias, fiz baseado no meu gosto pessoal, então sei que não vai agradar a todos, mas espero que seja útil para algúem 😄