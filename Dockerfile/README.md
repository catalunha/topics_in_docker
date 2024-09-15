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


```Dockerfile
# Use an official Python runtime as a parent image
FROM python:3.10-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt /app/

# Install the dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the app's source code
COPY . /app/

# Expose port 8000 for the Django app
EXPOSE 8000

# Run Django migrations and create the admin user
RUN python manage.py migrate

# Command to start the app
CMD ["gunicorn", "--workers=3", "--bind", "0.0.0.0:8000", "reminder_app.wsgi:application"]
```

```Dockerfile
# Dockerfile
FROM python:3.12

RUN mkdir /celery_service

COPY . /celery_service

RUN chmod +x /celery_service/docker-entrypoint.sh

RUN apt-get update
RUN apt-get install -y postgresql-client

WORKDIR /celery_service
ENV PYTHONPATH=${PYTHONPATH}:${PWD}
RUN pip3 install poetry
RUN poetry config virtualenvs.create false

RUN poetry install --no-dev


ENTRYPOINT ["/celery_service/docker-entrypoint.sh"]

CMD ["celery", "worker"]
```

```Dockerfile
# Dockerfile
FROM python:3.12

RUN mkdir /pinging_service

COPY . /pinging_service

RUN chmod +x /pinging_service/docker-entrypoint.sh

RUN apt-get update
RUN apt-get install -y netcat-traditional

WORKDIR /pinging_service
ENV PYTHONPATH=${PYTHONPATH}:${PWD}
RUN pip3 install poetry
RUN poetry config virtualenvs.create false

RUN poetry install --no-dev

CMD ["sh", "/pinging_service/docker-entrypoint.sh"]
```


A clásula CMD no Dockerfile é o mesmo que o comand no docker-compose


# Alguns tutoriais:
https://youtu.be/FnGxwmtUK0c?list=PLMEVlrVfhrHvrEkfdm85z5_YSNOYKYW2g
https://youtu.be/R8LyH6TCIUM?list=PLMEVlrVfhrHvrEkfdm85z5_YSNOYKYW2g