MACPORTS_CONFIG_PATH=$HOME/.dotfiles/macports/.config/macports/
MACPORTS_PORTS_FILE=$MACPORTS_CONFIG_PATH/ports.txt

port echo requested | awk '{print $1}' > $MACPORTS_PORTS_FILE
