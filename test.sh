#!/usr/bin/env bash

instance_name="GOMAP-PlantSpecific"
img_loc="$PWD/$instance_name.sif"
mkdir -p $PWD/tmp
unset SINGULARITY_TMPDIR

# if [ ! -f "$img_loc" ]
# then
#     echo "The ${instance_name} image is missing"
# 	singularity pull $img_loc shub://Dill-PICL/GOMAP-base > /dev/null
# fi

# if [ -z $tmpdir ]
# then
#     tmpdir=${TMPDIR:-$PWD/tmp}
# fi

# export SINGULARITY_BINDPATH="$PWD:/workdir,$tmpdir:/tmpdir,$PWD/GOMAP:/opt/GOMAP"

echo "$@"

cmd="singularity run $img_loc --input=test/B73v3.curated.gaf --output=test/B73v3.curated.plant-spec.gaf"
echo "$cmd"
eval "$cmd"