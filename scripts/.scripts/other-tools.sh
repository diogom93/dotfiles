# check for opencode
if command -v opencode &>/dev/null; then
  print_valid_message "OpenCode is installed."
else
  print_error_message "OpenCode is not installed."
  print_bullet_message "Installing OpenCode..."
  curl -fsSL https://opencode.dev/install.sh | bash || {
    print_error_message "Failed to install OpenCode."
    exit 1
  }
  print_valid_message "OpenCode installed."
fi
