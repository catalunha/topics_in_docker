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

## Dockerfile para Postgres

## Dockerfile para Rabbitmq

## Dockerfile para Redis

## Dockerfile para Python

```Dockerfile
FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt /app/

RUN pip install --no-cache-dir -r requirements.txt

COPY . /app/

EXPOSE 8000

CMD ['sh','-c','python manage.py migrate && python manage.py runserver 0.0.0.0:8000]
```

A clásula CMD no Dockerfile é o mesmo que o comand no docker-compose


# Alguns tutoriais:
https://youtu.be/FnGxwmtUK0c?list=PLMEVlrVfhrHvrEkfdm85z5_YSNOYKYW2g
https://youtu.be/R8LyH6TCIUM?list=PLMEVlrVfhrHvrEkfdm85z5_YSNOYKYW2g