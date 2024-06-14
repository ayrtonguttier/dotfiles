FROM ubuntu:latest


RUN apt update
RUN apt upgrade -y
RUN apt install stow -y
RUN apt install git -y
RUN apt install zsh -y
RUN apt install curl -y
RUN mkdir -p /opt/fzf
RUN curl https://github.com/junegunn/fzf/releases/download/0.53.0/fzf-0.53.0-linux_amd64.tar.gz -L | tar -xz -C /opt/fzf

WORKDIR /root
RUN git clone https://github.com/ayrtonguttier/dotfiles.git --branch docker
WORKDIR /root/dotfiles
RUN stow zsh
ENTRYPOINT [ "zsh" ]
