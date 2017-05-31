
# docker build --rm --tag tesseract .

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

RUN apt-get update --fix-missing && apt-get install -y wget bzip2 ca-certificates \
    libglib2.0-0 libxext6 libsm6 libxrender1 \
    git mercurial subversion

RUN echo 'export PATH=/opt/conda/bin:$PATH' > /etc/profile.d/conda.sh && \
    wget --quiet https://repo.continuum.io/archive/Anaconda3-4.3.1-Linux-x86_64.sh -O ~/anaconda.sh && \
    /bin/bash ~/anaconda.sh -b -p /opt/conda && \
    rm ~/anaconda.sh

ENV PATH /opt/conda/bin:$PATH

RUN /bin/bash -c 'mkdir /opt/caiman; \
    cd /opt/caiman;  \
    git clone  https://github.com/simonsfoundation/CaImAn;  \
    cd CaImAn;  \
    git pull;  \
    update conda;  \
    conda create -n CaImAn python=3.5  ipython --file requirements_conda.txt;  \
    activate CaImAn;  \
    pip install -r requirements_pip.txt;  \
    conda install -c menpo opencv3=3.1.0;  \
    python setup.py build_ext -i;  \
    conda update --all '
    

CMD [ "/bin/bash" ]

ENTRYPOINT ["caiman"]
CMD ["-h"]
