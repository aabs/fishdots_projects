#!/usr/bin/fish

function project
  if test 0 -eq (count $argv)
    project_help
    return
  end
  switch $argv[1]
    case add
      # project add <name> <path> <desc>
      emit add_project $argv[2] $argv[3] $argv[4]
    case cd
        project_cd $argv[2]
    case goto
        project_goto $argv[2]
    case help
        project_help
    case home
        project_home
    case ls
        project_list
    case open
        project_open
    case path
        project_path $argv[2]
    case save
        project_save
    case set
        project_set $argv[2]
    case sync
        project_sync
    case '*'
      project_help
  end
end

function project_help -d "display usage info"
  
  echo "Projects:"
  colour_print normal "  Current Project: "
  colour_print green $CURRENT_PROJECT_SN
  echo ""
  echo ""

  echo "USAGE:"
  echo ""
  echo "project <command> [options] [args]"
  echo ""
  
  echo "project cd"
  echo "  change to home dir of project"
  echo ""

  echo "project goto"
  echo "  change projects and go to home dir of chosen project"
  echo ""

  echo "project help"
  echo "  display usage info"
  echo ""

  echo "project home"
  echo "  go to the root directory of the current project"
  echo ""

  echo "project ls"
  echo "  list all available projects"
  echo ""

  echo "project path"
  echo "  get the root dir of the named project"
  echo ""

  echo "project save"
  echo "  save contents of project dir locally"
  echo ""

  echo "project set"
  echo "  change current project"
  echo ""

  echo "project sync"
  echo "  save contents of project dir locally"
  echo ""

end

function get_var_indirect -a prefix name
  set -l p (echo -n "$prefix$name")
  eval "echo -n $$p"
end


function project_path -a project_name
  get_var_indirect '_project_paths_' $project_name
end

function project_name -a project_name
  get_var_indirect '_project_name_' $project_name
end

function project_list -d "list projects with descriptions"
    for key in $_project_names
        if test $key = $CURRENT_PROJECT_SN
            colour_print brblue "$key:  "
            colour_print bryellow (get_var_indirect '_project_name_' $key)
        else
            colour_print green "$key:  "
            colour_print normal (get_var_indirect '_project_name_' $key)
        end
        echo ""
    end
end

function project_list_project_short_names
    for key in $_project_names
		echo $key        
    end
end

function project_list_project_long_names
  for key in $_project_names
    echo (get_var_indirect '_project_name_' $key)
  end
end

function project_home -d "goto home dir of current project"
  project_cd $CURRENT_PROJECT_SN    
  project_invoke_autorun 
  switch_tmux_sessions $CURRENT_PROJECT_SN
end

function project_invoke_autorun -d "look for the autorun.fish file in the current folder, and if present source it"
  if test -e "./autorun.fish"
    source "./autorun.fish"
  end
end

function project_goto -a project_name -d "switch projects"
  ok "Switching to "(project_name $project_name)
  project_set $project_name
  project_home
end

function project_set -a project_name
    set -U CURRENT_PROJECT_SN $project_name
end

function edit_project
    project_home
    $EDITOR 
end

function project_cd -a project_name
    cd (project_path $project_name)
end


function _create_project_task -a title
    _create_task "$title +$CURRENT_PROJECT_SN"
end

function _create_project_note_dated -a project_name
    note pcreate (date --iso-8601)"-$project_name"
    # notes n "$CURRENT_PROJECT_SN/"(date --iso-8601)"-$project_name"
end

function _project_quick_checkin -a checkin_message
    git add -A
    git rm (git ls-files --deleted) 2> /dev/null
    git commit --no-verify -m "$checkin_message"
    git push origin (fishdots_git_branch_name)
end

function _project_detach_from_tmux_session
    tmux detach -s $CURRENT_PROJECT_SN"-session"
end

function _list_project_tasks
    td list +$CURRENT_PROJECT_SN
end

function pcd -a project_name -d "switch to project directory"
    cd (project_path $project_name)
end

function project_save -d "save all new or modified notes locally"
  set -l pp (project path $CURRENT_PROJECT_SN)
  fishdots_git_save $pp  "project $CURRENT_PROJECT_SN wip"
end

function project_sync -d "save all changes on current project to origin repo"
  set -l pp (project path $CURRENT_PROJECT_SN)
  fishdots_git_sync $pp  "project $CURRENT_PROJECT_SN wip"
end

function project_open -d "select from existing projects"
  set matches $_project_names
  if test 1 -eq (count $matches) and test -d $matches
    set -U FD_PROB_CURRENT $matches[1]
    echo "chose option 1"
    return
  end
  set -g dcmd "dialog --stdout --no-tags --menu 'select the project' 20 60 20 " 
  set c 1
  for option in $matches
    set label (get_var_indirect  '_project_name_' $option)
    set -g dcmd "$dcmd $option '$c ($option) $label'"
    set c (math $c + 1)
  end
  set choice (eval "$dcmd")
  clear
  if test $status -eq 0
    echo "choice was $choice"
    project set $choice
    project home
  end
end

function switch_tmux_sessions -a session_name
  if contains $session_name (tm ls)
    tm goto $session_name
  else
    tm new $session_name
  end
end

