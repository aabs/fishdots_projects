function fish_prompt --description 'Write out the prompt'
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
    set -l color_cwd
    set -l suffix
    switch "$USER"
        case root toor
            if set -q fish_color_cwd_root
                set color_cwd $fish_color_cwd_root
            else
                set color_cwd $fish_color_cwd
            end
            set suffix '#'
        case '*'
            set color_cwd $fish_color_cwd
            set suffix '>'
    end

    echo -n -s "$USER" @ (prompt_hostname) ' ' (set_color $color_cwd) (prompt_pwd) (set_color normal) "$suffix "
end

function fish_mode_prompt -d "empty mode prompt"; end