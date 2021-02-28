IMAGE="GOMAP-PlantSpecific"
if [ -f "${IMAGE}.sif" ]
then
    sudo rm ${IMAGE}.sif
fi
mkdir -p $PWD/tmp
sudo singularity build --tmpdir $PWD/tmp ${IMAGE}.sif singularity/Singularity>build.out 2>build.err

