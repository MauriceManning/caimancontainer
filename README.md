# caimancontainer

### Current issues

1. environment variables are not transferred from Docker container to Singularity container on bootstrap
2. environment variable in Singularity bootstrap file are not created in resulting container
3. Not sure how to set a conda virtual environment as the default run environment inside the container
4. Not able to set a home driectory for the Singularity container results in warnings
  * WARNING: __Could not chdir to home directory: /global/home/users/mmanning__


### Workarounds

1. Edit /environment file inside the container to add the environment variables
2. set the virtual environment bin directory as the first path in the PATH
