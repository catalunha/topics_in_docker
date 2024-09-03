# Docker e Docker Compose na prática | dockerizando uma aplicação Django com Celery | py_live #012
https://youtu.be/R8LyH6TCIUM
transcrição deste docker compose aqui

O Dockerfile com a imagem do python serve de base para Django, Celey e Celery beat e para isto preciso alterar o CMD


# Configurações do Django:
```json
DATABASES = {
  "default": {
    "ENGINE": "django.db.backends.postgresql",
    "NAME": "postgres_db",
    "USER": "postgres_user",
    "PASSWORD": "postgres_password",
    "HOST": "db", // é o nome do serviço no docker-compose
    "PORT": 5432
  }
}
CELERY_BROKER_URL="pyamqp://guest@rabbitmq//"
CELERY_TIMEZONE = "America/São_Paulo"
CELERY_RESULT_BACKEND = "django-db"

```

# building

Buildar apenas o db

```docker compose up db --build```

Buildar apenas o rabbit

```docker compose up rabbitmq --build```

Agora com as dependencias construidas buildar tudo

```docker compose up```

Para acessar ao container use. Ou mesmo clicando a Attach shell na extensão do VScode
```
docker exec -it <container_name> /bin/bash
```