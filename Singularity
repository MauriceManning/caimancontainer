Bootstrap:docker
From:mmmanning/caiman:latest

%environment
PATH=/opt/conda/bin:$PATH
PYTHONPATH=/opt/caiman/CaImAn/:$PYTHONPATH

SHELL=/bin/bash
SINGULARITY_SHELL="/bin/bash --norc"

%post
source activate CaImAn
