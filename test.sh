#!/usr/bin/env bash

instance_name="GOMAP-PlantSpecific"
img_loc="$PWD/$instance_name.sif"
mkdir -p $PWD/tmp
unset SINGULARITY_TMPDIR

if [ ! -f "$img_loc" ]
then
    echo "The ${instance_name} image is missing"
	singularity pull $img_loc shub://bioinformapping/$instance_name > /dev/null
fi

echo "$@"

cmd="singularity run $img_loc --input=test/B73v3.curated.gaf --output=test/B73v3.curated.plant-spec.gaf"
echo "$cmd"
eval "$cmd"