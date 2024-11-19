if [[ -d $HOME/.cargo/bin ]]; then
    PATH="$HOME/.cargo/bin:$PATH"
fi

install_rustup () {
    if [[ ! -f "/home/$USER/.cargo/bin/rustup" ]]; then
        sh <(curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs) -y --no-modify-path;
    fi
}
