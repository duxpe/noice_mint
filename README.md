# Noice Mint 🎨

Este script faz algumas personalizações básicas no seu desktop, como definir um wallpaper aleatório, aplicar um tema e escolher um ícone baseado na cor predominante do wallpaper.

Fiz ele especificamente para o linux mint, para poder ter um desktop levemente personalizado já que no pc da faculdade a cada início de sessão tudo é resetado e limpo. 

## Como usar 🚀

1. **Clone o repositório:**
    ```sh
    git clone https://github.com/duxpe/noice_mint.git
    cd noice_mint/
    ```

2. **Edite o caminho da imagem:**
    Abra o arquivo  e altere a variável `IMG_PATH` para o caminho onde suas imagens estão armazenadas:
    ```sh
    IMG_PATH="/caminho/para/suas/imagens/"
    ```

3. **Execute o script:**
    ```sh
    ./noice.sh
    ```

## Requisitos 📋

- `gsettings`
- `git`
- `convert` (ImageMagick)

Todos esses requisitos estão geralmente presentes no pc do instituto.

## Nota 📝

A descrição deste README foi escrita em sua maioria por IA usando o GPT 4o, apenas editei a descrição e essa Nota. 😊
Após completar o script também utilizei IA para melhorar alguns detalhes como, por exemplo, a maneira que escolhia um wallpaper aleatório, dê uma lida antes de executar o script, alias, sempre leia os scripts antes de executar hehe.

