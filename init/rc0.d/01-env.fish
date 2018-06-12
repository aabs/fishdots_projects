set -U PROJECT_HOME $SYNC_HOME/active_personal/Projects

if not set -q $CURRENT_PROJECT_SN
    set -U CURRENT_PROJECT_SN dots
end
