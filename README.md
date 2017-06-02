# caimancontainer

### Current issues

1. environment variables are not transferred from Docker container to Singularity container on bootstrap
2. environment variable in Singularity bootstrap file are not created in resulting container
3. Not sure how to set a conda virtual environment as the default run environment inside the container
4. Not able to set a home driectory for the Singularity container results in warnings
    * WARNING: *Could not chdir to home directory: /global/home/users/mmanning*


### Workarounds

1. Edit /environment file inside the container to add the environment variables
2. set the virtual environment bin directory as the first path in the PATH


### Reproducing the issues

1. Create the Docker container
2. Create the empty Singularity image
3. Bootstrap the Singularity image
    * %sudo singularity  bootstrap caiman.img Singularity
4. Shell into the container
    * sudo singularity shell -B /home/vagrant/:/scratch/  --writable caiman.img
5. Verify the environment variables defined in the Singularity bootstrap
    * echo $PATH
    * echo $PYTHONPATH
6. Start python and import caiman
    * import caiman as cm
