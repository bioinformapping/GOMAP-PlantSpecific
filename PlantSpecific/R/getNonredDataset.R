# source("R/gafTools.R")
# source("R/genUtils.R")
# source("R/oboTools.R")

remove_redundancy = function(infile,outfile){
    
    go_obo = check_obo_data("data/go/go.obo")
    
    cat("Reading",infile,"\n")
    in_gaf = read_gaf(infile)
    
    cat("Checking for anomalies for alt_ids and aspect before removing redundancy\n")
    in_gaf = gaf_check_simple(go_obo,in_gaf)
    
    cat("Removing Redundancy from ",infile,"\n")
    unit_perc = 1
    unit_size=nrow(in_gaf) %/% (100/unit_perc)
    #out_gaf = in_gaf[,rm_red(.SD,aspect,db_object_id,.I,total_rows,graph,obsolete_terms,alt_ids),by=list(aspect,db_object_id)]
    out_gaf = in_gaf[,rm_red(.SD,aspect,db_object_id,go_obo,obs_and_alt,.I,unit_size,unit_perc,assigned_by),by=list(aspect,db_object_id)]
    setcolorder(out_gaf,gaf_cols)
    
    cat("Writing NR of ",infile, "to",outfile,"\n")
    write_gaf(out_gaf,outfile)
}

rm_gaf_red  = function(in_gaf,go_obo){
    back_buff = paste(rep("b",16),collapse = "")
    obs_and_alt = c(unlist(go_obo$alt_id[go_obo$obsolete]),names(go_obo$obsolete[go_obo$obsolete]))
    
    in_gaf = gaf_check_simple(go_obo,in_gaf)
    gaf_col_order = colnames(in_gaf)
    
    unit_perc = 2
    unit_size=nrow(in_gaf) %/% (100/unit_perc)
    out_gaf = in_gaf[,rm_red(.SD,aspect,db_object_id,go_obo,obs_and_alt,.I,unit_size,unit_perc,assigned_by),by=list(aspect,db_object_id)]
    setcolorder(out_gaf,gaf_col_order)
    return(out_gaf)
}

rm_red <- function(data,aspect,gene,go_obo,obs_and_alt,idxs,unit_size,unit_perc,tool_name){
    print_dt_progress(unit_size,idxs,unit_perc,tool_name)
    leaf_terms = get_minimal_set(list(unique(data$term_accession)),go_obo,obs_and_alt)
    return(unique(data[term_accession %in% leaf_terms]))
}

get_minimal_set = function(go_nodes,go_obo,obs_and_alt){
    go_nodes = unlist(go_nodes)
    out_nodes = minimal_set(go_obo,go_nodes)
    return(out_nodes)
}
