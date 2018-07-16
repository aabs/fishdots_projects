
# assoc usage patterns
# ==========================
# assoc.set name[key] value
# assoc.get name[key]
# assoc.rm  name[key]
# assoc.has_key name[key]

    set _project_names coins erl fd career thor notes kops probs fdp fdproj tlive ngoss relay

    assoc.set project_paths[tlive]   "$HOME/dev/by-technology/elixir/tlive"    
    assoc.set project_names[tlive]  "TLive 2 Development"    
    
    assoc.set project_paths[coins]   "$FINANCE_DIR"    
    assoc.set project_names[coins]  "Ledger crypto-coin accounts"    
    
    assoc.set project_paths[erl]     "$PROJECT_HOME/by-technology/erlang/katas"   
    assoc.set project_names[erl]    "Erlang Code Katas"	

    assoc.set project_paths[fd]    "$FISHDOTS" 
    assoc.set project_names[fd]   "My Fish Dotfiles"    
    
    assoc.set project_paths[career]  "$CAREER_DIR" 
    assoc.set project_names[career] "My Career Plan" 

    assoc.set project_paths[notes]   "$HOME/notes" 
    assoc.set project_names[notes]  "My Text Notes Collection" 

    assoc.set project_paths[probs]   "$FD_PROBLEM_HOME" 
    assoc.set project_names[probs]  "The Problems root directory" 

    assoc.set project_paths[fdp]    "$HOME/dev/fishdots_problem"
    assoc.set project_names[fdp]   "Fishdots Problem Plugin"

    assoc.set project_paths[kops]    "/mnt/d/Synchronised/active_personal/Projects/by-technology/docker/kubernetes/kops"
    assoc.set project_names[kops]   "Kubernetes kops experiments"

    assoc.set project_paths[fdproj]    "$FISHDOTS_PLUGINS_HOME/fishdots_projects"
    assoc.set project_names[fdproj]   "Fishdots plugin for projects"

    assoc.set project_paths[relay]    "$PROJECT_HOME/by-technology/elixir/thor/tlive-thor-poc-relay"
    assoc.set project_names[relay]    "THOR POC Relay"

    assoc.set project_paths[ngoss]    "$PROJECT_HOME/by-technology/elixir/thor/tlive-thor-elk/ngoss"
    assoc.set project_names[ngoss]    "NGOSS instance of LogStash in tlive thor elk"

    assoc.set project_paths[thor]    "$PROJECT_HOME/by-technology/elixir/thor/" 
    assoc.set project_names[thor]   "THOR home"	
