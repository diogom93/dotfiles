UV_CONFIG_PATH=$HOME/.dotfiles/uv/.config/uv/
UV_CONFIG_FILE=$UV_CONFIG_PATH/tools.txt

uv tool list | awk 'NR>1{print $2}' > $UV_CONFIG_FILE
