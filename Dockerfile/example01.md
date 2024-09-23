Considere o seguinte artigo:
https://medium.com/@johnidouglasmarangon/a-minimal-restful-api-in-python-2c316bd2c0c3


Este é o Dockerfile para construir/build a imagem

```Dockerfile
FROM python:3.12.3-slim-bullseye


WORKDIR /app

COPY . /app

RUN pip install --no-cache-dir -r requirements.txt 

EXPOSE 8000

ENV APP_WORKERS=${APP_WORKERS:-1}

CMD uvicorn main:app --host 0.0.0.0 --port 8000 --workers ${APP_WORKERS}
```

Aqui o comando para build a imagem
```
docker image build -t myminimalapi .
```

E executar/run a imagem
```
docker run -e APP_WORKERS=8 -p 8000:8000 myminimalapi
```

