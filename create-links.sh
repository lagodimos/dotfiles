REPO_DIR=$(xdg-user-dir PROJECTS)/dotfiles

rm -f /home/$USER/.profile
ln -s $REPO_DIR/.profile /home/$USER/.profile

# Bash
rm -f /home/$USER/.bashrc
ln -s $REPO_DIR/.bashrc /home/$USER/.bashrc

# .config
mkdir -p $HOME/.config/ashell
rm -f $HOME/.config/ashell/config.toml
ln -s $REPO_DIR/.config/ashell/config.toml $HOME/.config/ashell/config.toml

rm -f /home/$USER/.var/app/dev.zed.Zed/config/zed/settings.json
ln -s $REPO_DIR/.config/zed/settings.json /home/$USER/.var/app/dev.zed.Zed/config/zed/settings.json

rm -f /home/$USER/.var/app/com.rioterm.Rio/config/rio/config.toml
ln -s $REPO_DIR/.config/rio/config.toml /home/$USER/.var/app/com.rioterm.Rio/config/rio/config.toml

symlink-scripts.sh
