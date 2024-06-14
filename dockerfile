FROM ubuntu:latest


RUN apt update
RUN apt upgrade -y
RUN apt install curl -y
RUN apt install git -y
RUN apt install zsh -y
RUN apt install stow -y

# fuzzy finder
RUN mkdir -p /opt/fzf
RUN curl https://github.com/junegunn/fzf/releases/download/0.53.0/fzf-0.53.0-linux_amd64.tar.gz -L | tar -xz -C /opt/fzf

# zoxide
RUN mkdir -p /opt/zoxide
RUN curl https://github.com/ajeetdsouza/zoxide/releases/download/v0.9.4/zoxide-0.9.4-aarch64-unknown-linux-musl.tar.gz -L | tar -xz -C /opt/zoxide

WORKDIR /root
RUN git clone https://github.com/ayrtonguttier/dotfiles.git --branch docker
WORKDIR /root/dotfiles
RUN stow zsh
ENTRYPOINT [ "zsh" ]
