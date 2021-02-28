# GOMAP-PlantSpecific

[![https://www.singularity-hub.org/static/img/hosted-singularity--hub-%23e32929.svg](https://www.singularity-hub.org/static/img/hosted-singularity--hub-%23e32929.svg)](https://singularity-hub.org/collections/5218)

A container to filter GO annotations to filter for plant-specific GO terms from any annotation file in gaf 2.0 format
*Note: This is the default output format from [GOMAP](https://github.com/Dill-PICL/GOMAP-singularity)*  

## Steps to run the container

1. Download the container from [Singularity hub](https://singularity-hub.org/)
   ```
	singularity pull \
		GOMAP-PlantSpecific.sif \
		shub://bioinformapping/GOMAP-PlantSpecific
   ```
2. Filter the gaf file using the container. See an example below
   ```
	singularity run \
		GOMAP-PlantSpecific.sif \
		--input=test/B73v3.curated.gaf \
		--output=test/B73v3.curated.plant-spec.gaf
   ```
3. [OPTIONAL] Use the latest Gene Ontology Structure
   ```
	singularity run \
		GOMAP-PlantSpecific.sif \
		--input=test/B73v3.curated.gaf \
		--go_obo=test/go.obo \
		--output=test/B73v3.curated.plant-spec.gaf
   ```
