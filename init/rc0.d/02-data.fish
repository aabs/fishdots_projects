
function __create_project_entry -S -e on_project_add -a name root_path desc
  if test -e $XDG_CONFIG_HOME/fishdots/config/projects.yaml
    echo  -e "  - $name:\n    shortname: $name\n    path: $root_path\n    description: $description\n" >> $XDG_CONFIG_HOME/fishdots/config/projects.yaml
  end
end
