
# assoc usage patterns
# ==========================
# assoc.set name[key] value
# assoc.get name[key]
# assoc.rm  name[key]
# assoc.has_key name[key]

    set _project_names coins erl fd career thor notes kops probs fdp fdproj

    assoc.set project_paths[coins]   "$FINANCE_DIR"    
    assoc.set project_names[coins]  "Ledger crypto-coin accounts"    
    
    assoc.set project_paths[erl]     "$PROJECT_HOME/by-technology/erlang/katas"    
    assoc.set project_names[erl]    "Erlang Code Katas"	

    assoc.set project_paths[fd]    "$FISHDOTS" 
    assoc.set project_names[fd]   "My Fish Dotfiles"    
    
    assoc.set project_paths[career]  "$CAREER_DIR" 
    assoc.set project_names[career] "My Career Plan" 

    assoc.set project_paths[thor]    "/mnt/d/Synchronised/active_work/Projects/thor/test" 
    assoc.set project_names[thor]   "THOR test harness"	

    assoc.set project_paths[notes]   "$HOME/notes" 
    assoc.set project_names[notes]  "My Text Notes Collection" 

    assoc.set project_paths[probs]   "$FD_PROBLEM_HOME" 
    assoc.set project_names[probs]  "The Problems root directory" 

    assoc.set project_paths[fdp]    "$HOME/dev/fishdots_problem"
    assoc.set project_names[fdp]   "Fishdots Problem Plugin"

    assoc.set project_paths[kops]    "/mnt/d/Synchronised/active_personal/Projects/by-technology/docker/kubernetes/kops"
    assoc.set project_names[kops]   "Kubernetes kops experiments"

    assoc.set project_paths[fdproj]    "$FISHDOTS_PLUGINS_HOME/fd_projects"
    assoc.set project_names[fdproj]   "Fishdots plugin for projects"
