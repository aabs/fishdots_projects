
function _create_project_entry -S -e add_project
  set -l n $argv[1]
  set -l p $argv[2]
  set -l d $argv[3]
  echo "Project: $n ($d $p)"
  if not contains $n $_project_names
    echo "for real!"
    set -g _project_names $_project_names $n
    eval "set -g _project_paths_$n '$p'"
    eval "set -g _project_name_$n '$d'"
  end
end

emit add_project tsrep "/home/d235108/dev/by-technology/timescale/replication" "TimescaleDB Replication"
emit add_project rdf    "/home/d235108/dev/by-technology/rdf" "rdf experiments"
emit add_project spark "/home/d235108/dev/by-technology/spark" "experiments in Spark"
emit add_project fd   "$FISHDOTS" "My Fish Dotfiles"
emit add_project tunnels   "~" "session for tunnels"
emit add_project probs  "$FD_PROB_HOME" "The Problems root directory"
emit add_project fdproj   "$FISHDOTS_PLUGINS_HOME/fishdots_projects" "Fishdots plugin for projects"
emit add_project vsparcpy "/home/d235108/dev/by-technology/python/vsparc/vsparc_mqtt_collector" "vSPARC Solution"
emit add_project wifidr  "$HOME/dev/by-technology/python/wifidr/prototypes/wifidr_cli" "WiFi Doctor (CLI)"
emit add_project thorapi "/home/d235108/dev/by-technology/elixir/thor/thorapi" "THOR API"
emit add_project vsparctsdb   "$PROJECT_HOME/by-technology/elixir/vsparc/tlive_vsparc" "vSPARC TSDB database persistence"
emit add_project ngoss   "/home/d235108/dev/by-technology/elixir/ngoss/ngoss_ingest_relay/src" "General API development over NGOSS data"
