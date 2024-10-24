# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "term"; then

  # Create a new window inline within session layout definition.
  new_window "term"
  
  split_h 50
  select_pane 1
  run_cmd "fastfetch"

  split_v 50
  select_pane 2
  run_cmd "btop"

  new_window 

  select_window 0
  select_pane 0
fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
