# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
session_root "~/Projects/onyx/"
# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "pexp"; then

  # Create a new window inline within session layout definition.
  new_window "term"
  
  run_cmd "fastfetch"

  split_h 50
  run_cmd "btop"

  split_v 50

  run_cmd "pnpm nx serve dev-proxy"

  split_v 50
  run_cmd "pnpm nx serve checkout"

  select_pane 0

  new_window "nvim"
  select_window 1
  run_cmd "nvim"

  new_window "git"
  select_window 2
  run_cmd "lazygit"

  select_window 0
  select_pane 0
fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
