FROM nvcr.io/nvidia/pytorch:25.04-py3
RUN python3 -m pip install -U pip && python3 -m pip install \
    hydra-core \
    hydra-submitit-launcher \
    ipdb \
    seaborn \
    imageio \
    moviepy \
    opencv-python \
    gym \
    wandb \
    setproctitle \
    tensorboardX \
    pytest \
    flake8 \
    pydocstyle \
    pyvirtualdisplay \
    ray \
    dm-tree \
    tabulate \
    h5py \
    matplotlib \
    scipy \
    numpy \
    torch-ema \
    pytorch-lightning \
    torch_geometric \
    einops \
    torch_scatter

RUN apt update && apt install -y \
    libx11-dev \
    libxrandr-dev \
    libxinerama-dev \
    libxcursor-dev \
    libxi-dev \
    libsfml-dev

COPY ./nocturne /workspace/nocturne
COPY ./third_party /workspace/third_party
COPY ./setup.py /workspace/setup.py
RUN python /workspace/setup.py develop
WORKDIR /workspace/ctrl_sim