# this could have been set via the localrc file (as in my work machine)
if not set -q PROJECT_HOME
  warn "PROJECT_HOME not set. Setting up from SYNC_HOME if available"
  if test -d $SYNC_HOME
    set -U PROJECT_HOME $SYNC_HOME/active_personal/Projects
  end
end

if not set -q $CURRENT_PROJECT_SN
    set -U CURRENT_PROJECT_SN vsparc
end
