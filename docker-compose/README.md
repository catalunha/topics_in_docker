# docker-compose

Comando | Descrição
---|---
docker compose up | Cria os containers e inicia os serviços
docker compose up -d | Cria os containers e inicia os serviços em daemon
docker compose up --build | Constroe os containers e inicia os serviços
docker compose start | Inicia os serviços
docker compose stop | Para os serviços
docker compose down | Para os serviços e remove os serviços, rede, etc
docker compose ls | Lista os arquivos de componse em execução
docker compose ps | Lista os containers de componse em execução
docker compose -p `compose_project_name` ps | Lista os containers de um projeto compose
docker compose -f <compose_filename.yml> up/down/etc | Executa ação e compose específico

# Considere o seguinte docker-compose.yaml
https://devhints.io/docker-compose

```yaml
services:
  service_name: #Nome do serviço ou container. Pode ser postgres, redis, web, db, etc
    # Building
    ## Build de um Dockerfile local
    build: .
    ## Build de um Dockerfile customizado
    build:
      context: ./path
      dockerfile: Dockerfile.dev
    ## Build de uma imagem, informar o tag é importante
    image: python:3.12
    # Portas
    ports:
      - "3000"
      ## host_port:container_port
      - "8000:80" 
    ## Expoe uma porta para um serviço vinculado (não para host)
    expose: ["3000"]
    # Variáveis de ambiente
    ## Use qualquer um destes formatos
    enviroment:
      VAR_NAME: var_value
    enviroment:
      - VAR_NAME=var_value
    env_file:
      - .env
    env_file: [.env,.env.development]
    volumes:
      # podemos criar um volume ligado a um volume do docker
      - <volume_name>:/container_path # volume_docker:container_path
      # Ou podemos criar um volume local
      - .data_docker/postgres:/var/lib/postgresql/data/
      - .data_docker/rabbitmq:/var/lib/rabbitmq/mnesia/
      - .data_docker/redis:/data
    restart: always
    depends_on:
      - service_name
    # Links
    ## makes the db service available as the hostname
    # (implies depends_on)
    links:
      - db:database
      - redis
    # command to execute
    command: bundle exec thin -p 3000
volumes: 
  # Informe o nome do volume do docker.
  <volume_name>:
# creates a custom network called `frontend`
networks:
  frontend:  
```

A clásula CMD no Dockerfile é o mesmo que o comand no docker-compose

# Tutoriais

https://github.com/docker/awesome-compose/blob/master/official-documentation-samples/django/README.md

https://devhints.io/docker-compose

https://gist.github.com/jonlabelle/bd667a97666ecda7bbc4f1cc9446d43a