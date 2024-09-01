# Sobre o Dockerfile

Comando | Descrição
---|---
FROM `image_name`:`tag` | Imagem base para a nova imagem sendo criada
MAINTAINER `email`| Mantenedor desta imagem
WORKDIR `container_path` | Define uma pasta padrao no container
COPY `host_path` `container_path` | Copia coisa do local para o container
RUN `args` | Executa comando dentro de um container
CMD `args` | Inicia comandos dentro do container ao ser iniciado
ENV `name_variable` `value_variable` | Define variáveis de ambiente para o container
EXPOSE [`port_container`] | Expoe que porta o container escuta

## Dockerfile para postgres

## Dockerfile para rabbitmq

## Dockerfile para redis
