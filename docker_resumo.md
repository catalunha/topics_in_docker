# Meu resumo Docker

## Ações sobre imagens

Comando | Descrição
---|---
docker image build -t `image_name`:`image_tag` `pathToDockerfile` | Build uma imagem de um arquivo chamado Dockerfile. Se Dockerfile na pasta atual basta digitar "."
docker image ls | Mostra uma lista com todas as imagens
docker image rm  `image_name` | Deletar uma imagem
docker image history `image_name`:`tag`| Exibe o histórico de uma imagem
docker image pull `image_name`:`tag`| Download uma imagem
docker image tag `old_image_name` `new_image_name`:`tag` | Coloca um tag numa imagem
docker image prune | Remove uma imagem que não está sendo utilizada
docker image prune -a | Remove todas as imagens que não estão sendo usadas por containers

### Estrutura de um Dockerfile

```Dockerfile
FROM `image:tag`

ENV APP_WORKERS=${APP_WORKERS:-1}

WORKDIR /path

COPY Makefile /path/
COPY entrypoints /path/entrypoints

RUN apt-get update

EXPOSE 8000

ENTRYPOINT ["/path/entrypoints/entrypoint.sh"]

CMD ['bash','-c','python manage.py migrate && python manage.py runserver 0.0.0.0:8000']
```
A clásula CMD no Dockerfile é o mesmo que o comand no docker-compose.yml


## Ações sobre containers

Comando | Descrição
---|---
docker container run ... `image_name`:`tag` | Inicia um novo container de uma imagem
docker container run ... --name `container_name` ... | define um nome a este container
docker container run ... -d ... | inicia em segundo plano
docker container run ... -p `host_port`:`container_port` ... | define uma porta
docker container run ... -v `host_dir`:`container_dir` ... | associa um volume ao container
docker container run ... -env-file `env_file` ... | faz a leitura das variáveis de ambiente
docker container run ... --hostname `host_name` ... | associa a um hostname 
docker container run ... --workdir `path` ... | Configura um diretório de trabalho em um container
docker container run ... --rm ... | Remove um container quando ele é encerrado
docker container create --name `container_name` `image_name` | Cria um novo container a partir de uma imagem, mas nao o inicia.
docker container start `container_name` | Iniciar a execução de um container
docker container stop `container_name` | Parar a execução de um container
docker container rm `container_name` | Deleta um container
docker container rename `old_container_name` `new_container_name` | renomear um container
docker container cp `container_name`:`container_path` `host_path` | Copiar um arquivo do container para o host
docker container cp `host_path` `container_name`:`container_path`| Copiar um arquivo do host para o container
docker container exec -it `container_name` `/bin/bash` | Inicia o shell dentro do container em execução. Onde `shell` pode ser bash, sh, etc
docker container ls | Mostra uma lista de todos os containers ativos
docker container ls -a | Mostra uma lista de todos os containers ativos e inativos
docker container commit `container_name` `image_name`:`tag` | Cria uma nova imagem a partir de um container


# Informações e Estatisticas sobre o docker

Comando | Descrição
---|---
docker info | Informações do docker no sistema
docker inspect `object_name` | Pega detalhes sobre um objeto
docker logs `container_name` | Mostra os logs de um container
docker port `container_name` | Mostra as portas mapeadas de um container
docker stats | Mostra estatisticas de container em execução
docker top `container_name` | Mostra processos de containers
docker version | Mostra versao do docker


#  Ações sobre registry

Comando | Descrição
---|---
docker login | Faz o login em um registry
docker logout | Faz o logout de um registry
docker pull `repository/image_name` | Traz ou busca uma imagem de um registro (pull)
docker push `repository/image_name` | Envia ou leva uma imagem a um registry (push)


# Comandos de serviço

Comando | Descrição
---|---
docker service ls	| Lista todos os serviços que estão rodando em um swarm
docker stack services stackname	| Lista todos os serviços que estão rodando
docker service ps servicename	| Lista a tarefa (task) de um serviço
docker service update servicename	| Atualiza um serviço
docker service create image	| Cria um novo serviço
docker service scale servicename=10	| Dimensiona um ou mais serviços replicados
docker service logs stackname servicename	| Lista todos os registros (logs) de serviços

# Comandos de network

Comando | Descrição
---|---
docker network create `network_name`	| Cria uma nova rede (new network)
docker network rm `network_name`	| Remove uma rede específica
docker network ls	| Lista todas as redes
docker network connect `network_name` `container_name` | Conecta um container a uma rede
docker network disconnect `network_name` `container_name`	| Desconecta um container de uma rede
docker network inspect `network_name`	| Exibe informações detalhadas sobre a rede (network)