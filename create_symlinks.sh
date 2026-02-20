rm -f /home/$USER/.profile
ln -s /home/$USER/git/dotfiles/.profile /home/$USER/.profile

# Bash
rm -f /home/$USER/.bashrc
ln -s /home/$USER/git/dotfiles/.bashrc /home/$USER/.bashrc

# Scripts
rm -rf /home/$USER/.scripts
ln -s /home/$USER/git/dotfiles/.scripts /home/$USER/.scripts

rm -f /home/$USER/.var/app/dev.zed.Zed/config/zed/settings.json
ln -s /home/$USER/git/dotfiles/zed/settings.json /home/$USER/.var/app/dev.zed.Zed/config/zed/settings.json
