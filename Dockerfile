ARG repository
FROM ${repository}:8.0-runtime-ubuntu16.04
LABEL maintainer "NVIDIA CORPORATION <cudatools@nvidia.com>"

RUN echo "deb https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1604/x86_64 /" > /etc/apt/sources.list.d/nvidia-ml.list

ENV CUDNN_VERSION 7.2.1.38
LABEL com.nvidia.cudnn.version="${CUDNN_VERSION}"

RUN apt-get update && \
    apt-get install -y --no-install-recommends libcudnn7=$CUDNN_VERSION-1+cuda8.0 && \
    apt-mark hold libcudnn7 && \
    apt-get install -y --no-install-recommends python3 python3-pip && \
    pip3 install deepspeech-gpu && \
    rm -rf /var/lib/apt/lists/*
