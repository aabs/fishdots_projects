
function _create_project_entry -S -e on_add_project
  set -l n $argv[1]
  set -l p $argv[2]
  set -l d $argv[3]
  if not contains $n $_project_names
    set -U _project_names $_project_names $n
    eval "set -U _project_paths_$n '$p'"
    eval "set -U _project_name_$n '$d'"
  end
end
