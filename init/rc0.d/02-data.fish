
# assoc usage patterns
# ==========================
# assoc.set name[key] value
# assoc.get name[key]
# assoc.rm  name[key]
# assoc.has_key name[key]

function _create_project_entry -e project_add_project -a prj_name prj_path prj_desc -d 'create a new project entry'
  if not contains $prj_name $_project_names
    set -U _project_names $_project_names $prj_name
    assoc.set project_paths[$prj_name] $prj_path
    assoc.set project_names[$prj_name] $prj_desc
  end
end

if not set -q _project_names

  set _project_names  fd probs fdproj vsparcpy tunnels wifidr ngoss spark rdf tsrep

  assoc.set project_paths[tsrep]    "/home/d235108/dev/by-technology/timescale/replication"
  assoc.set project_names[tsrep]   "TimescaleDB Replication"

  assoc.set project_paths[rdf]    "/home/d235108/dev/by-technology/rdf"
  assoc.set project_names[rdf]   "rdf experiments"

  assoc.set project_paths[spark]    "/home/d235108/dev/by-technology/spark"
  assoc.set project_names[spark]   "experiments in Spark"

  assoc.set project_paths[fd]    "$FISHDOTS"
  assoc.set project_names[fd]   "My Fish Dotfiles"

  assoc.set project_paths[tunnels]    "~"
  assoc.set project_names[tunnels]   "session for tunnels"

  assoc.set project_paths[probs]   "$FD_PROB_HOME"
  assoc.set project_names[probs]  "The Problems root directory"

  assoc.set project_paths[fdproj]    "$FISHDOTS_PLUGINS_HOME/fishdots_projects"
  assoc.set project_names[fdproj]   "Fishdots plugin for projects"

  assoc.set project_paths[vsparcpy]  "/home/d235108/dev/by-technology/python/vsparc/vsparc_mqtt_collector"
  assoc.set project_names[vsparcpy]  "vSPARC Solution"

  assoc.set project_paths[wifidr]   "$HOME/dev/by-technology/python/wifidr/prototypes/wifidr_cli"
  assoc.set project_names[wifidr]  "WiFi Doctor (CLI)"

  assoc.set project_paths[thorapi]  "/home/d235108/dev/by-technology/elixir/thor/thorapi"
  assoc.set project_names[thorapi]  "THOR API"

  assoc.set project_paths[vsparctsdb]    "$PROJECT_HOME/by-technology/elixir/vsparc/tlive_vsparc"
  assoc.set project_names[vsparctsdb]   "vSPARC TSDB database persistence"

  assoc.set project_paths[ngoss]    "/home/d235108/dev/by-technology/elixir/ngoss/ngoss_ingest_relay/src"
  assoc.set project_names[ngoss]    "General API development over NGOSS data"

end

################
# OLD STUFF
################

# old projects:  coins career notes kops  erl mqtt vsparcnix vsparctsdb vsparcrelay  thor probs fdp  tlive ngoss tsdb  nix thorapi

# assoc.set project_paths[wifidr_poc]   "$HOME/dev/by-technology/python/wifidr/prototypes/poc_transformation"
# assoc.set project_names[wifidr_poc]  "WiFi Doctor poc"
#
# assoc.set project_paths[vsparcrelay]    "$PROJECT_HOME/by-technology/elixir/vsparc/tlive-vsparc-timescale-relay"
# assoc.set project_names[vsparcrelay]   "Fork of Dales Persistence Stuff"
#
# assoc.set project_paths[vsparcnix]  "/home/d235108/dev/by-technology/python/vsparc/tlive-vsparc"
# assoc.set project_names[vsparcnix]  "Nixified vSPARC Solution"
#
# assoc.set project_paths[tlive]   "$HOME/dev/by-technology/elixir/tlive"
# assoc.set project_names[tlive]  "TLive 2 Development"
#
# assoc.set project_paths[fdp]    "$FISHDOTS_PLUGINS_HOME/fd_problem"
# assoc.set project_names[fdp]   "Fishdots Problem Plugin"
#
# assoc.set project_paths[thor]    "$PROJECT_HOME/by-technology/elixir/thor/"
# assoc.set project_names[thor]   "THOR home"
#
# assoc.set project_paths[nix]    "/home/d235108/dev/by-technology/nix/exercises"
# assoc.set project_names[nix]   "Nix Exercises"
#
# assoc.set project_paths[tsdb]    "/home/d235108/dev/by-technology/elixir/benchmarks"
# assoc.set project_names[tsdb]   "TimescaleDB benchmarks"

# assoc.set project_paths[ngoss]    "$PROJECT_HOME/by-technology/elixir/thor/tlive-thor-ngoss"
# assoc.set project_names[ngoss]    "NGOSS instance of LogStash in tlive thor elk"

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
