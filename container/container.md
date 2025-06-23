
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


# Tutoriais
https://www.hostinger.com/br/tutoriais/docker-cheat-sheet