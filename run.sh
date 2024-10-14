#!/bin/bash
docker run --platform linux/amd64 -it --rm -d \
    --net=host \
	-e DISPLAY=127.0.0.1:0.0 \
	-v $HOME/eda:/root \
	--name ic618_rt  \
    --entrypoint /root/entrypoint.sh ic618:v1
