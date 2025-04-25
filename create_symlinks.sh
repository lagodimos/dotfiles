# Bash
rm -f /home/$USER/.bashrc
ln -s /home/$USER/git/dotfiles/.bashrc /home/$USER/.bashrc

rm -f /home/$USER/.var/app/dev.zed.Zed/config/zed/settings.json
ln -s /home/$USER/git/dotfiles/zed/settings.json /home/$USER/.var/app/dev.zed.Zed/config/zed/settings.json
