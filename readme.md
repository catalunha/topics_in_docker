# Instalando Docker no Ubuntu

Atualize seu Sistema
```
sudo apt update
sudo apt upgrade
```

Instale Pacotes de Pré-requisitos
```
sudo apt-get install  curl apt-transport-https ca-certificates software-properties-common
```

Adicione uma chave GPG, os Repositórios do Docker e atualize o sistema
```
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update
```

Garanta que você está instalando a partir do repositório do Docker, ao invés do repositório padrão do Ubuntu ao usar este comando:
```
apt-cache policy docker-ce
```

Instalar Docker Ubuntu
```
sudo apt install docker-ce
```

Verificar Status do Docker
```
sudo systemctl status docker
```

Testando o docker
```
sudo docker run hello-world
```

Finalmente, se você quiser usar o Docker sem privilégios root, basta usar o comando abaixo e reiniciar o computador.
```
sudo usermod -aG docker $(whoami)
```

[Tutorial 01](https://www.hostinger.com.br/tutoriais/install-docker-ubuntu?utm_campaign=Generic-Tutorials-DSA|NT:Se|LO:BR-t1&utm_medium=ppc&gad_source=1&gclid=CjwKCAjwuMC2BhA7EiwAmJKRrMphB_F9uDXh49Mbi6wqOFWNK8x2Ni3VU_TVcKM-rxq7CVY3oWsiQRoC0EEQAvD_BwE)


# Executar um novo container

Comando | Descrição
---|---
docker run `image_name` | Inicia um novo container de uma imagem
docker run --name `container_name` `image_name` | ... e define um nome a este container
docker run -p `host_port`:`container_port` `image_name` | ... e define uma porta
docker run -d `image_name` | ... e inicia em segundo plano
? docker run --hostname `host_name` `image_name` | ... e associa a um hostname 
docker run -v `host_dir`:`container_dir` `image_name` | ... e associa um volume ao container

# Gerenciando Containers
Comando | Descrição
---|---
docker ps -a | Mostra uma lista de todos os containers
docker rm `container_name` | Deleta um container
docker stop `container_name` | Parar a execução de um container
docker start `container_name` | Iniciar a execução de um container
docker rename `old_container_name` `new_container_name` | renomear um container
docker exec -it `container_name` `shell` | Inicia o shell dentro do container em execução. Onde `shell` pode ser bash, sh, etc
docker cp `container_name`:`container_path` `host_path` | Copiar um arquivo do container para o host
docker cp `host_path` `container_name`:`container_path`| Copiar um arquivo do host para o container


# Gerenciando Imagens
Comando | Descrição
---|---
docker pull `image_name`:`tag`| Download uma imagem
docker rmi  `image_name` | Deletar uma imagem
docker images | Mostra uma lista com todas as imagens
docker build `Dockerfile_path` | Build uma imagem de um Dockerfile, se local basta digitar "."
docker tag `old_image_name` `new_image_name`:`tag` | Coloca um tag numa imagem

# Infos e Stats
Comando | Descrição
---|---
docker logs `container_name` | Mostra os logs de um container
docker stats | Mostra estatisticas de container em execução
docker top `container_name` | Mostra processos de containers
docker version | Mostra versao do docker
docker inspect `object_name` | Pega detalhes sobre um objeto
docker port `container_name` | Mostra as portas mapeadas de um container
