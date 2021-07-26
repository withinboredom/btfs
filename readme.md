```sh
make
make patch-release

# configure first node
ssh node -L 5001:localhost:5001
mkdir .btfs
chmod go+w .btfs
docker run -it -v /home/withinboredom/.btfs:/home/btfs/.btfs --rm withinboredom/btfs:0.1.0 init
# replace 127.0.0.1 with 0.0.0.0
docker run -it -v /home/withinboredom/.btfs:/home/btfs/.btfs --rm -p 5001:5001 withinboredom/btfs:0.1.0 config edit
docker run -it -v /home/withinboredom/.btfs:/home/btfs/.btfs --rm -p 5001:5001 withinboredom/btfs:0.1.0 wallet password
# run this and can now visit localhost:5001
docker run -it -v /home/withinboredom/.btfs:/home/btfs/.btfs --rm -p 5001:5001 withinboredom/btfs:0.1.0 config profile apply storage-host
docker run -it -v /home/withinboredom/.btfs:/home/btfs/.btfs --rm -p 5001:5001 withinboredom/btfs:0.1.0
exit

#configure second node
ssh node -L 5001:localhost:5001
mkdir .btfs
chmod go+w .btfs
docker run -it -v /home/withinboredom/.btfs:/home/btfs/.btfs --rm withinboredom/btfs:0.1.0 init
# replace 127.0.0.1 with 0.0.0.0
docker run -it -v /home/withinboredom/.btfs:/home/btfs/.btfs --rm -p 5001:5001 withinboredom/btfs:0.1.0 config edit
docker run -it -v /home/withinboredom/.btfs:/home/btfs/.btfs --rm -p 5001:5001 withinboredom/btfs:0.1.0 wallet import -m
docker run -it -v /home/withinboredom/.btfs:/home/btfs/.btfs --rm -p 5001:5001 withinboredom/btfs:0.1.0 wallet password
docker run -it -v /home/withinboredom/.btfs:/home/btfs/.btfs --rm -p 5001:5001 withinboredom/btfs:0.1.0 config profile apply storage-host
docker run -it -v /home/withinboredom/.btfs:/home/btfs/.btfs --rm -p 5001:5001 withinboredom/btfs:0.1.0 config --json API.HTTPHeaders.Access-Control-Allow-Origin '["http://192.168.1.12:5001", "http://0.0.0.0:5001"]'
docker run -it -v /home/withinboredom/.btfs:/home/btfs/.btfs --rm -p 5001:5001 withinboredom/btfs:0.1.0 config --json API.HTTPHeaders.Access-Control-Allow-Methods '["PUT", "GET", "POST"]'
```
