
# docker build --rm --tag caiman .

##
## Dockerfile for caiman
##

## Built using Ubuntu 16.04 LTS (xenial) since that is one of the
## targets available in PPA and is a Long Term Support (LTS)
## https://wiki.ubuntu.com/Releases

FROM ubuntu:xenial

RUN apt-get update && \
    apt-get install -y software-properties-common && \
    apt-get update
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8

RUN apt-get update --fix-missing && apt-get install -y gcc libgl1-mesa-swx11 libgtk2.0-0 wget bzip2 ca-certificates \
    libglib2.0-0 libxext6 libsm6 libxrender1 \
    git mercurial subversion



RUN echo 'export PATH=/opt/conda/bin:$PATH' > /etc/profile.d/conda.sh && \
    wget --quiet https://repo.continuum.io/miniconda/Miniconda3-4.3.11-Linux-x86_64.sh -O ~/miniconda.sh && \
    /bin/bash ~/miniconda.sh -b -p /opt/conda && \
    rm ~/miniconda.sh

RUN apt-get install -y curl grep sed dpkg && \
    TINI_VERSION=`curl https://github.com/krallin/tini/releases/latest | grep -o "/v.*\"" | sed 's:^..\(.*\).$:\1:'` && \
    curl -L "https://github.com/krallin/tini/releases/download/v${TINI_VERSION}/tini_${TINI_VERSION}.deb" > tini.deb && \
    dpkg -i tini.deb && \
    rm tini.deb && \
    apt-get clean

ENV PATH /opt/conda/bin:$PATH

RUN /bin/bash -c 'mkdir /opt/caiman; \
    cd /opt/caiman;  \
    git clone  https://github.com/simonsfoundation/CaImAn;  \
    cd CaImAn;  \
    git pull;  \
    conda update conda;  \
    conda create -n CaImAn python=3.5  ipython --file requirements_conda.txt;  \
    source activate CaImAn;  \
    pip install -r requirements_pip.txt;  \
    conda install -c menpo opencv3=3.1.0;  \
    python setup.py build_ext -i;  \
    conda update --all '
  
CMD [ "pip", "install", "PyQt5==5.5.1" ]
  
ENV PATH /opt/conda/bin:$PATH
ENV PYTHONPATH /opt/caiman/CaImAn/:$PYTHONPATH

ENV SHELL=/bin/bash
