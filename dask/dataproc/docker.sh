docker build --no-cache -t rapids_container . && \

ifconfig && \

docker run --runtime=nvidia --gpus all -it -d -p 8008:8888 -p 8007:8787 -p 8006:8786 -v /home/$USER/:/home/$USER/ rapids_container

