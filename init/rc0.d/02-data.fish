
function _create_project_entry -S -e on_project_add -a name root_path desc
  if not contains $name $_project_names
    set -U _project_names $_project_names $name
    eval "set -U _project_paths_$name '$root_path'"
    eval "set -U _project_name_$name '$desc'"
  end
end
