
# Ações sobre o container

Comando | Descrição
---|---
? docker container run --hostname `host_name` `image_name` | ... e associa a um hostname 
docker container cp `container_name`:`container_path` `host_path` | Copiar um arquivo do container para o host
docker container cp `host_path` `container_name`:`container_path`| Copiar um arquivo do host para o container
docker container exec -it `container_name` `shell` | Inicia o shell dentro do container em execução. Onde `shell` pode ser bash, sh, etc
docker container ls -a | Mostra uma lista de todos os containers
docker container rename `old_container_name` `new_container_name` | renomear um container
docker container rm `container_name` | Deleta um container
docker container run --name `container_name` `image_name` | ... e define um nome a este container
docker container run -d `image_name` | ... e inicia em segundo plano
docker container run -p `host_port`:`container_port` `image_name` | ... e define uma porta
docker container run -v `host_dir`:`container_dir` `image_name` | ... e associa um volume ao container
docker container run -env-file `env_file` `image_name` | ... e faz a leitura das variáveis de ambiente
docker container run `image_name` | Inicia um novo container de uma imagem
docker container start `container_name` | Iniciar a execução de um container
docker container stop `container_name` | Parar a execução de um container



# Exemplo de containers para:

## Redis
!Falta especificar a tag correta do redis.

```
docker image pull redis
docker container run -p 6379:6379 --name name_of_redis -d redis
docker container ls -a
```
## Mongo

```
docker container run -d -v my_mongo_tag_volume:/data/db -p 27017:27017 mongo
```


## RabbitMQ

docker run -it --rm --name rabbitmq -p 5672:5672 -p 15672:15672 rabbitmq:3.13-management
