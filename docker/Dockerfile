## cmd: docker build . --force-rm=true --no-cache=true -t wf001/ws0test:1.0
FROM ubuntu:jammy

WORKDIR /root

RUN apt update && apt install -y \
zsh \
git \
curl \
gcc \
make \
wget \
unzip \
build-essential

RUN apt update && apt install -y \
autoconf \
automake \
pkg-config

# ctags
RUN git clone https://github.com/universal-ctags/ctags.git /tmp/ctags&&\
		cd /tmp/ctags && \
    ./autogen.sh &&\
    ./configure &&\
    make &&\
    make install

RUN apt update && apt install -y language-pack-ja-base \
language-pack-ja \
zlib1g-dev \
libssl-dev \
libffi-dev \
libreadline-dev

# pyenv
RUN git clone https://github.com/yyuu/pyenv.git ~/.pyenv &&\
apt update && \
apt install -y \
libsqlite3-dev \
libreadline6-dev \
libbz2-dev \
libssl-dev \
libsqlite3-dev \
libncursesw5-dev \
libffi-dev \
libdb-dev \
libexpat1-dev \
zlib1g-dev \
liblzma-dev \
libgdbm-dev \
libmpdec-dev && \
~/.pyenv/bin/pyenv install 3.10.6 &&\
~/.pyenv/bin/pyenv global 3.10.6


# Node
RUN git clone https://github.com/nodenv/nodenv.git ~/.nodenv &&\
git clone https://github.com/nodenv/node-build.git ~/.nodenv/plugins/node-build &&\
~/.nodenv/bin/nodenv install 16.16.0 &&\
~/.nodenv/bin/nodenv global 16.16.0

# NeoVim
RUN curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage && \
chmod u+x nvim.appimage && \
./nvim.appimage --appimage-extract && \
mv squashfs-root / && \
ln -s /squashfs-root/AppRun /usr/bin/nvim && \
rm -f nvim.appimage

# additional(not essential)
RUN apt update && apt install -y \
tig \
tmux \
tree \
traceroute \
lsof \ 
whois \
#dig
dnsutils \
direnv \
nmap

RUN $HOME/.nodenv/shims/npm i -g diff-so-fancy &&\
$HOME/.pyenv/shims/pip install httpie

CMD ["/usr/bin/zsh"]
