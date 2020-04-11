#!/usr/bin/fish
define_command project "fishdots plugin for working on projects"
define_subcommand project add on_project_add ""

define_subcommand project add on_project_add "add a new project to the master list"
define_subcommand_nonevented project cd on_project_home "change to home dir of project"
define_subcommand_nonevented project cur project_cur "show the current project short name"
define_subcommand_nonevented project edit project_edit "edit in project home folder"
define_subcommand_nonevented project goto project_goto "change projects and go to home dir of chosen project"
define_subcommand_nonevented project home project_home "go to the root directory of the current project"
define_subcommand_nonevented project ls project_ls "list all available projects"
define_subcommand_nonevented project open project_open "select and switch to project"
define_subcommand project path on_project_path "get the root dir of the named project"
define_subcommand project quicksave on_project_save "save and clean contents of project dir locally"
define_subcommand project set on_project_set "change current project"
define_subcommand project save on_project_save "save contents of project dir locally"
define_subcommand project sync on_project_sync "save project and push upstream"
define_subcommand project todo on_project_todo "create a task for this project"
define_subcommand project purge on_project_purge "remove all project config data"


function get_var_indirect -a prefix name
  set -l p (echo -n "$prefix$name")
  eval "echo -n $$p"
end

function project_path -a project_name
  get_var_indirect '_project_paths_' $project_name
end

function project_cur
  echo $CURRENT_PROJECT_SN
end

function project_cd -a sn 
  cd (project_path $sn)
end

function project_name -a project_name
  get_var_indirect '_project_name_' $project_name
end

function project_list -e on_project_ls -d "list projects with descriptions"
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

function project_home -e on_project_home -d "goto home dir of current project"
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

function project_set -e on_project_set -a project_name
    set -U CURRENT_PROJECT_SN $project_name
end

function project_edit 
    project_home
    eval "$EDITOR (project_path $CURRENT_PROJECT_SN)"
end

function _create_project_note_dated -a project_name
    note pcreate (date --iso-8601)"-$project_name"
    # notes n "$CURRENT_PROJECT_SN/"(date --iso-8601)"-$project_name"
end

function _project_quick_checkin -e on_project_quicksave -a checkin_message
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

function project_save -e on_project_save -d "save all new or modified notes locally"
  set -l pp (project path $CURRENT_PROJECT_SN)
  fishdots_git_save $pp  "project $CURRENT_PROJECT_SN wip"
end

function project_sync -e on_project_sync -d "save all changes on current project to origin repo"
  set -l pp (project path $CURRENT_PROJECT_SN)
  fishdots_git_sync $pp  "project $CURRENT_PROJECT_SN wip"
end

function project_open -d "select from existing projects"
    fd_item_selector $_project_names
    if set -q fd_selected_item
      project set $fd_selected_item
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

function project_purge -e on_project_purge -d "remove all project setting env vars"
  for x in (set -u | egrep -Z "^_project" | cut -f1 -d' ')
    set -e $x
  end
end