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
    case e
        edit_project $argv[2]
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
    case set
        project_set $argv[2]
    case sync
        project_sync
    case todo
      emit task_project_new $argv[2]
    case menu
      project_menu
    case '*'
      project_help
  end
end

function project_menu
  if test 0 -eq (count $argv)
    set -l options "home" "ls" "open" "sync" "help"
		menu $options
    project $options[$menu_selected_index]
  else 
    project $argv
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
  _fd_display_option 'project' 'e' "edit in project home folder"
  _fd_display_option 'project' 'cd' "change to home dir of project"
  _fd_display_option 'project' "goto" "change projects and go to home dir of chosen project"
  _fd_display_option 'project' "help" "display usage info"
  _fd_display_option 'project' "home" "go to the root directory of the current project"
  _fd_display_option 'project' "ls" "list all available projects"
  _fd_display_option 'project' "open" "select and switch to project"
  _fd_display_option 'project' "path" "get the root dir of the named project"
  _fd_display_option 'project' "set" "change current project"
  _fd_display_option 'project' "sync" "save contents of project dir locally"
  _fd_display_option 'project' "todo" "create a task for this project"
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
  switch_tmux_sessions $CURRENT_PROJECT_SN
end

function project_invoke_autorun -e fd_entered_folder -a abs_path -d "look for the autorun.fish file in the current folder, and if present source it"
  if test -e "$abs_path/autorun.fish"
    source "$abs_path/autorun.fish"
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
    eval "$EDITOR (project_path $CURRENT_PROJECT_SN)"
end

function project_back
  _fd_leave
end


function project_cd -a project_name
  _fd_enter (project_path $project_name)
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
  set pl (project_list_project_short_names | sort)
  menu $pl
  project set $pl[$menu_selected_index]
  project home
end

function switch_tmux_sessions -a session_name
  if contains $session_name (tm ls)
    tm goto $session_name
  else
    tm new $session_name
  end
end

