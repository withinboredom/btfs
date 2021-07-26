```sh
make build
make .env
make tag
make push

ssh node
mkdir .btfs
chmod go+w .btfs
docker run -it -v /home/withinboredom/.btfs:/home/btfs/.btfs --rm withinboredom/btfs init

```
