
# docker build -t ctrl_sim:latest .
docker run \
    --gpus all --runtime nvidia \
    -it --rm \
    --ipc=host --ulimit memlock=-1 --ulimit stack=67108864 \
    -v ./:/workspace/ctrl_sim \
    -v /media/taiga/wd_nvme_2tb/ctrl_sim_dataset:/workspace/ctrl_sim_dataset \
    ctrl_sim:latest