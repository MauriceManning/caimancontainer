Bootstrap:docker
From:mmmanning/caiman:latest

%environment
SHELL=/bin/bash
PATH=/opt/conda/bin:$PATH
SINGULARITY_SHELL="/bin/bash --norc"
PYTHONPATH=/opt/caiman/CaImAn/:$PYTHONPATH

%post
export SHELL PATH SINGULARITY_SHELL PYTHONPATH

exec mkdir /scratch/
