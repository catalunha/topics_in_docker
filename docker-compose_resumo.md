# Meu resumo docker-compose

Comando | Descrição
---|---
docker compose up | Cria os containers e inicia os serviços. De um docker-compose.yml na pasta corrente.
docker compose up -d | Cria os containers e inicia os serviços em daemon e sai do rastreamento. De um docker-compose.yml na pasta corrente.
docker compose up --build | Constroe os containers e inicia os serviços.  De um docker-compose.yml na pasta corrente.
docker compose start | Inicia os serviços
docker compose stop | Para os serviços
docker compose down | Para os serviços e remove os serviços, rede, etc
docker compose -f <path/docker-compose.yml> up/down/etc | Executa ação em um docker-compose.yml específico
docker compose ls | Lista os arquivos de componse em execução
docker compose -p `docker-compose_name` ps | Lista os containers de um projeto compose

## Outros comandos a pesquisar
docker compose version 
docker compose config    
docker compose start
docker compose stop
docker compose restart
docker compose run    
docker compose create  
docker compose attach      
docker compose pause
docker compose unpause
docker compose wait   
docker compose up
docker compose down
docker compose ps
docker compose top 
docker compose events   
docker compose logs
docker compose images
docker compose build      
docker compose push  
docker compose cp       
docker compose exec 




## Exemplo de docker-compose.yml

```yaml
services:
  <service02_name>: #Nome do serviço ou container. Pode ser postgres, database, db, redis, app, djangoproject, web, db, etc
    # Building
    ## Build de um Dockerfile local
    build: .
    ## Build de um Dockerfile customizado
    build:
      context: ./path
      dockerfile: Dockerfile.dev
    ## Build de uma imagem, informar o tag é importante
    image: python:3.12
    # Nomear o container
    container_name: ibo-backend-postgres16
    # Portas
    ports:
      ## host_port:container_port
      - "8000:80" 
    # Expoe uma porta para um serviço vinculado (não para host)
    expose: 3000
    # Variáveis de ambiente
    ## Formato 1
    enviroment:
      VAR_NAME: var_value
    ## Formato 2
    enviroment:
      - VAR_NAME=var_value
    ## Formato 3
    env_file:
      - .env
    ## Formato 4
    env_file: [.env,.env.development]
    # Volumes
    volumes:
      # podemos criar um volume ligado a um volume do docker
      - <volume_name>:/container_path # volume_docker:container_path
      # Ou podemos criar um volume local
      - .data/postgres:/var/lib/postgresql/data/
      - .data/rabbitmq:/var/lib/rabbitmq/mnesia/
      - .data/redis:/data
    # Restart
    restart: always
    # Estabelecendo dependencias
    depends_on:
      - <service01_name>
    # Links
    ## makes the db service available as the hostname(implies depends_on)
    links:
      - db:database
      - redis
    # Executa um comando.
    ## Formato 01
    command: bash -c /backend/entrypoints/entrypoint.sh
    ## Formato 02
    command: bash -c "uv run python manage.py collectstatic --noinput && uv run gunicorn project.wsgi:application --bind 0.0.0.0:8000 -workers 3"
    ## Formato 03
    command: >
      /bin/bash -c "
        uv run python manage.py collectstatic --noinput
        uv run gunicorn project.wsgi:application --bind 0.0.0.0:8000 --workers 3
      "
    entrypoint: [ "bash", "-c", "/backend/entrypoints/entrypoint.sh" ]

volumes: 
  ## Informe o nome do volume do docker.
  <volume_name>:
networks:
  ## creates a custom network called `frontend`
  <frontend>:  
```


A clásula CMD no Dockerfile é o mesmo que o comand no docker-compose

# Tutoriais
https://devhints.io/docker-compose
https://github.com/docker/awesome-compose/blob/master/official-documentation-samples/django/README.md

https://devhints.io/docker-compose

https://gist.github.com/jonlabelle/bd667a97666ecda7bbc4f1cc9446d43a