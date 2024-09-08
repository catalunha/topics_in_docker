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

# Tutoriais
[Tutorial 01](https://www.hostinger.com.br/tutoriais/install-docker-ubuntu?utm_campaign=Generic-Tutorials-DSA|NT:Se|LO:BR-t1&utm_medium=ppc&gad_source=1&gclid=CjwKCAjwuMC2BhA7EiwAmJKRrMphB_F9uDXh49Mbi6wqOFWNK8x2Ni3VU_TVcKM-rxq7CVY3oWsiQRoC0EEQAvD_BwE)

[Tutorial 02](https://levelup.gitconnected.com/docker-beginner-to-expert-tutorial-68555aa3e544)

[Tutorial 03](https://github.com/wsargent/docker-cheat-sheet?tab=readme-ov-file#why-docker)

## PyCodeBR
### Docker do zero: dockerizando uma aplicação Python e Django | py_live #007
https://youtu.be/FnGxwmtUK0c
Ja assistida e transcrita aqui

### Docker e Docker Compose na prática | dockerizando uma aplicação Django com Celery | py_live #012
Dados nesta pasta: docker-compose/docker_compose_3
https://youtu.be/R8LyH6TCIUM
Visto e transcrito.
