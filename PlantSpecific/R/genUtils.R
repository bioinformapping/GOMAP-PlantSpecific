print_dt_progress = function(unit_size,idxs,unit_perc=1,tool_name="data"){
    #print(idxs)
    # backspace = paste(rep("\b",18),collapse = "")
    if(sum(idxs %% unit_size == 0)>0){
        # cat(backspace)
        perc = idxs[idxs %% unit_size == 0] / unit_size * unit_perc
        cat("Processing",unique(tool_name),sprintf("%05.1f",perc[1]),"%","\n")
       # Sys.sleep(1)
    }
}