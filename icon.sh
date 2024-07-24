#!/bin/bash

# Verifica se o ImageMagick está instalado
if ! command -v magick &> /dev/null; then
  echo "ImageMagick não está instalado. Instalando agora..."
  sudo dnf install -y imagemagick
  if [ $? -ne 0 ]; then
    echo "Falha ao instalar o ImageMagick. Por favor, instale manualmente e execute o script novamente."
    exit 1
  fi
fi

# Verifica se a imagem icon.png existe
if [ ! -f icon.png ]; then
  echo "A imagem icon.png não foi encontrada!"
  exit 1
fi

# Cria a pasta icons se não existir
mkdir -p icons

# Converte a imagem icon.png para os diferentes tamanhos de ícones
magick icon.png -resize 32x32 icons/icon-32x32.png
magick icon.png -resize 72x72 icons/icon-72x72.png
magick icon.png -resize 96x96 icons/icon-96x96.png
magick icon.png -resize 128x128 icons/icon-128x128.png
magick icon.png -resize 144x144 icons/icon-144x144.png
magick icon.png -resize 152x152 icons/icon-152x152.png
magick icon.png -resize 192x192 icons/icon-192x192.png
magick icon.png -resize 384x384 icons/icon-384x384.png
magick icon.png -resize 512x512 icons/icon-512x512.png

# Cria o favicon.ico contendo vários tamanhos
magick icon.png -resize 16x16 icons/icon-16x16.png
magick icon.png -resize 32x32 icons/icon-32x32.png
magick icon.png -resize 48x48 icons/icon-48x48.png
magick icon.png -resize 64x64 icons/icon-64x64.png
magick icons/icon-16x16.png icons/icon-32x32.png icons/icon-48x48.png icons/icon-64x64.png -colors 256 favicon.ico

# Limpa os ícones temporários
rm icons/icon-16x16.png
rm icons/icon-64x64.png

echo "Ícones e favicon.ico foram criados com sucesso na pasta icons e no diretório atual."

