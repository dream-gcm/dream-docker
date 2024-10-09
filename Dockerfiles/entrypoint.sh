#!/bin/sh

# Activate the Spack environment
. /opt/spack-environment/activate.sh  # Source the Spack activation script

# Start Jupyter Lab in the background
jupyter lab --ip=0.0.0.0 --no-browser --allow-root &

# Execute any additional commands passed to the script
exec "$@"
