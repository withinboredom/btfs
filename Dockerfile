FROM ubuntu:latest
RUN apt-get update && apt-get install -y wget curl perl
RUN groupadd -r btfs && useradd -r -g btfs btfs
USER btfs
WORKDIR /home/btfs
RUN wget https://raw.githubusercontent.com/TRON-US/btfs-binary-releases/master/install.sh
RUN bash install.sh -o linux -a amd64
ENV PATH=${PATH}:/home/btfs/btfs/bin
VOLUME /home/btfs/.btfs
ENTRYPOINT ["btfs"]
CMD ["daemon"]
EXPOSE 5001
