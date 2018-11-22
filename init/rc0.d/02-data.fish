
# assoc usage patterns
# ==========================
# assoc.set name[key] value
# assoc.get name[key]
# assoc.rm  name[key]
# assoc.has_key name[key]

    set _project_names fd thor probs fdp fdproj tlive ngoss tsdb vsparc2 vsparc vsparc3 nix

# old porject names:  coins career notes kops  erl mqtt

    assoc.set project_paths[tlive]   "$HOME/dev/by-technology/elixir/tlive"    
    assoc.set project_names[tlive]  "TLive 2 Development"    

    assoc.set project_paths[fd]    "$FISHDOTS" 
    assoc.set project_names[fd]   "My Fish Dotfiles"    

    assoc.set project_paths[probs]   "$FD_PROBLEM_HOME" 
    assoc.set project_names[probs]  "The Problems root directory" 

    assoc.set project_paths[fdp]    "$FISHDOTS_PLUGINS_HOME/fd_problem"
    assoc.set project_names[fdp]   "Fishdots Problem Plugin"

    assoc.set project_paths[fdproj]    "$FISHDOTS_PLUGINS_HOME/fishdots_projects"
    assoc.set project_names[fdproj]   "Fishdots plugin for projects"

    assoc.set project_paths[ngoss]    "$PROJECT_HOME/by-technology/elixir/thor/tlive-thor-ngoss"
    assoc.set project_names[ngoss]    "NGOSS instance of LogStash in tlive thor elk"

    assoc.set project_paths[vsparc3]    "$PROJECT_HOME/by-technology/elixir/vsparc/persistence/vsparc_tsdb_relay" 
    assoc.set project_names[vsparc3]   "vSPARC TSDB database persistence"	

    assoc.set project_paths[thor]    "$PROJECT_HOME/by-technology/elixir/thor/" 
    assoc.set project_names[thor]   "THOR home"	

    assoc.set project_paths[nix]    "/home/d235108/dev/by-technology/nix/exercises"
    assoc.set project_names[nix]   "Nix Exercises"	

    assoc.set project_paths[tsdb]    "/home/d235108/dev/by-technology/elixir/benchmarks" 
    assoc.set project_names[tsdb]   "TimescaleDB benchmarks"	

    assoc.set project_paths[vsparc]  "/home/d235108/dev/by-technology/python/vsparc/vsparc_mqtt_collector" 
    assoc.set project_names[vsparc]  "vSPARC Solution"	

    assoc.set project_paths[vsparc2]  "/home/d235108/dev/by-technology/python/vsparc/tlive-vsparc" 
    assoc.set project_names[vsparc2]  "Nixified vSPARC Solution"	

################
# OLD STUFF
################

# assoc.set project_paths[kops]    "/mnt/d/Synchronised/active_personal/Projects/by-technology/docker/kubernetes/kops"
# assoc.set project_names[kops]   "Kubernetes kops experiments"

# assoc.set project_paths[notes]   "$HOME/notes" 
# assoc.set project_names[notes]  "My Text Notes Collection" 

# assoc.set project_paths[career]  "$CAREER_DIR" 
# assoc.set project_names[career] "My Career Plan" 

# assoc.set project_paths[erl]     "$PROJECT_HOME/by-technology/erlang/katas"   
# assoc.set project_names[erl]    "Erlang Code Katas"	

# assoc.set project_paths[coins]   "$FINANCE_DIR"    
# assoc.set project_names[coins]  "Ledger crypto-coin accounts"    

#assoc.set project_paths[relay]    "$PROJECT_HOME/by-technology/elixir/thor/tlive-thor-poc-relay"
#assoc.set project_names[relay]    "THOR POC Relay"
