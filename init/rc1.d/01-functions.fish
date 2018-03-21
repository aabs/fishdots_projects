#!/usr/bin/fish

function project
  if test 0 -eq (count $argv)
    project_help
    return
  end
  switch $argv[1]
    case home
        project_help
    case help
        project_help
    case '*'
      project_help
  end
end

function project_help -d "display usage info"
  echo "Fishdots project Usage"
  echo "======================"
  echo "project <command> [options] [args]"
  echo ""
  echo "project edit pattern"
  echo "  edit the project identified by the path"
  echo ""
  echo "project find pattern"
  echo "  find the project by searching file names"
  echo ""
  echo "project search pattern"
  echo "  perform a full text search for patterns"
  echo ""
  echo "project create title"
  echo "  create a new project"
  echo ""
  echo "project pcreate title"
  echo "  create a new project within a project area"
  echo ""
  echo "project save"
  echo "  save any new or modified projects locally"
  echo ""
  echo "project move"
  echo "  explain,,,"
  echo ""
  echo "project sync"
  echo "  synchronise projects with origin git repo"
  echo ""
  echo "project home"
  echo "  cd to the projects directory"
  echo ""
  echo "project help"
  echo "  EXPL"
end


function project_path -a project_name
    echo (assoc.get project_paths[$project_name])
end

function project_name -a project_name
    echo (assoc.get project_names[$project_name])
end

function project_list_project_short_names
    for key in $_project_names
		echo $key        
    end
end

function project_list_project_long_names
    for key in $_project_names
		echo (assoc.get project_names[$key])
    end
end

function goto -a project_name
    ok "Switching to "(project_name $project_name)
    set_current_project $project_name
    pcd $project_name
end

function set_current_project -a project_name
    set -U CURRENT_PROJECT_SN $project_name
end

function edit_project
    _cd_project_directory
	$EDITOR 
end

function _cd_current_project_directory
    _cd_project_directory $CURRENT_PROJECT_SN
end

function _cd_project_directory -a project_name
    cd (project_path $project_name)
end


function _create_project_task -a title
    _create_task "$title +$CURRENT_PROJECT_SN"
end

function _create_project_note_dated -a project_name
    notes n "$CURRENT_PROJECT_SN/"(date --iso-8601)"-$project_name"
end

function _project_quick_checkin -a checkin_message
    git add -A
    git rm (git ls-files --deleted) 2> /dev/null
    git commit --no-verify -m "$checkin_message"
    git push origin (git branch-name)
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

