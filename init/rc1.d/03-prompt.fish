function fish_mode_prompt
  set_color -b red
  set_color yellow
  echo -n -e $CURRENT_PROJECT_SN" "
  if set -q -U K8S_ENV
    set_color black
    set_color -b yellow
    echo -n $K8S_ENV" "
  end 
  if set -q -U K8S_NS
    set_color black
    set_color -b green
    echo -n $K8S_NS" "
  end 
  if set -q -U K8S_NS
    set_color black
    set_color -b white
    echo -n "~> "(get_ssh_host)" "
  end 
  set_color normal
  set_color -b normal
end