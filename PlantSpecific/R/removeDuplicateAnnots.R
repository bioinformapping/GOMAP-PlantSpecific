source("R/gafTools.R")
source("R/oboTools.R")

get_uniq_annots <- function(in_gaf,out_gaf){
    data = read_gaf(in_gaf)
    uniq_data = data[,.SD[1],by=c("db_object_id","term_accession")]  
    setcolorder(uniq_data,gaf_cols)
    write_gaf(uniq_data,out_gaf)
}


