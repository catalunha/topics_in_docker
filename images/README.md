# Ações sobre as imagens

Comando | Descrição
---|---
docker image ls | Mostra uma lista com todas as imagens
docker image rm  `image_name` | Deletar uma imagem
docker imagem build -t `image_name:image_tag` `Dockerfile_path` | Build uma imagem de um Dockerfile com um nome. Se Dockerfile na pasta atual basta digitar "."
docker imagem pull `image_name`:`tag`| Download uma imagem
docker imagem tag `old_image_name` `new_image_name`:`tag` | Coloca um tag numa imagem
