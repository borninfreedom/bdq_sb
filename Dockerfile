FROM ubuntu:16.04

RUN apt-get -y update && apt-get -y install git wget python-dev python3-dev libopenmpi-dev python-pip zlib1g-dev cmake libglib2.0-0 libsm6 libxext6 libfontconfig1 libxrender1
ENV CODE_DIR /root/code
ENV VENV /root/venv

RUN \
    pip install virtualenv && \
    virtualenv $VENV --python=python3 && \
    . $VENV/bin/activate && \
    mkdir $CODE_DIR && \
    cd $CODE_DIR && \
    pip install --upgrade pip && \
    pip install pytest && \
    pip install pytest-cov && \
    pip install codacy-coverage && \
    pip install scipy && \
    pip install tqdm && \
    pip install joblib && \
    pip install zmq && \
    pip install dill && \
    pip install progressbar2 && \
    pip install mpi4py && \
    pip install cloudpickle && \
    pip install tensorflow>=1.4.0 && \
    pip install click && \
    pip install opencv-python && \
    pip install numpy && \
    pip install pandas && \
    pip install pytest && \
    pip install matplotlib && \
    pip install seaborn && \
    pip install glob2 && \
    pip install gym[mujoco,atari,classic_control,robotics]

COPY . $CODE_DIR/stable_baselines
RUN \
    . $VENV/bin/activate && \
    cd $CODE_DIR && \
    pip install -e stable_baselines

ENV PATH=$VENV/bin:$PATH
WORKDIR $CODE_DIR/baselines

CMD /bin/bash
