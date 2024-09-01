# docker-compose

Comando | Descrição
---|---
docker compose up | Cria os containers e inicia os serviços
docker compose start | Inicia os serviços
docker compose stop | Para os serviços
docker compose down | Para os serviços e remove os serviços, rede, etc
docker compose ls | Lista os arquivos de componse em execução
docker compose -p `compose_project_name` ps | Lista os containers de um projeto compose

Considere o seguinte docker-compose.yaml

```yaml
services:
  <service_name>: Nome do serviço ou container. Pode ser postgres, redis, web, etc
    container_name: name_of_container # se não especificado é o mesmo nome do serviço
    # Build de um Dockerfile local
    build: .
    # Build de um Dockerfile customizado
    build:
      context: ./path
      dockerfile: Dockerfile.dev
    # Build de uma imagem
    image: `image_name`:`tag`
    # Nome do container
    ports:
      - "3000"
      - "8000:80" # host_port:container_port
    # Expoe uma porta para um serviço vinculado (não para host)
    expose: ["3000"]
    env_file:
      - .env
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
volumes: 
  # Informe o nome do volume do docker.
  <volume_name>:
```

# Tutoriais

https://github.com/docker/awesome-compose/blob/master/official-documentation-samples/django/README.md

https://devhints.io/docker-compose
