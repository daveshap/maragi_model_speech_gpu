FROM ubuntu:16.04
RUN apt-get update && \
    #apt-get install -y --no-install-recommends curl wget && \
    #curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | bash && \
    apt-get install -y --no-install-recommends python3 python3-pip git && \
    git clone https://github.com/mozilla/DeepSpeech && \
    wget -O - https://github.com/mozilla/DeepSpeech/releases/download/v0.2.0/deepspeech-0.2.0-models.tar.gz | tar xvfz - && \
    pip3 install deepspeech-gpu
