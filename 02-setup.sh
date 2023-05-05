#!/bin/sh

./sh-util/unset.sh

DIR=`pwd`

## NeoVim
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
     ~/.local/share/nvim/site/pack/packer/start/packer.nvim
mkdir -p ~/.config/nvim/colors && 
mkdir -p ~/.config/nvim/lua && 
mkdir -p ~/.config/nvim/lua/common
mkdir -p ~/.config/nvim/lua/lang
mkdir -p ~/.config/nvim/lua/colorscheme
mkdir -p ~/.config/nvim/lua/plugins
ln -s ${DIR}/vim/init.lua ~/.config/nvim/init.lua &&
ln -s ${DIR}/vim/common/local.lua ~/.config/nvim/lua/common/local.lua &&
ln -s ${DIR}/vim/common/lsp.lua ~/.config/nvim/lua/common/lsp.lua &&
ln -s ${DIR}/vim/common/ui.lua ~/.config/nvim/lua/common/ui.lua &&
ln -s ${DIR}/vim/common/basic.lua ~/.config/nvim/lua/common/basic.lua &&
ln -s ${DIR}/vim/lang/clojure.lua ~/.config/nvim/lua/lang/clojure.lua &&
ln -s ${DIR}/vim/lang/php.lua ~/.config/nvim/lua/lang/php.lua &&

ln -s ${DIR}/vim/plugins/ale.lua ~/.config/nvim/lua/plugins/ale.lua &&
ln -s ${DIR}/vim/plugins/fidget.lua ~/.config/nvim/lua/plugins/fidget.lua &&
ln -s ${DIR}/vim/plugins/furgitive.lua ~/.config/nvim/lua/plugins/furgitive.lua &&
ln -s ${DIR}/vim/plugins/rgrep.lua ~/.config/nvim/lua/plugins/rgrep.lua &&
ln -s ${DIR}/vim/plugins/tagbar.lua ~/.config/nvim/lua/plugins/tagbar.lua &&
ln -s ${DIR}/vim/plugins/telescope.lua ~/.config/nvim/lua/plugins/telescope.lua &&
ln -s ${DIR}/vim/plugins/treesitter.lua ~/.config/nvim/lua/plugins/treesitter.lua &&
ln -s ${DIR}/vim/plugins/toggleterm.lua ~/.config/nvim/lua/plugins/toggleterm.lua &&
ln -s ${DIR}/vim/plugins/floaterm.lua ~/.config/nvim/lua/plugins/floaterm.lua &&
ln -s ${DIR}/vim/plugins/aerial.lua ~/.config/nvim/lua/plugins/aerial.lua &&
ln -s ${DIR}/vim/plugins/nvim-tree.lua ~/.config/nvim/lua/plugins/nvim-tree.lua &&
ln -s ${DIR}/vim/plugins/symbols-outline.lua ~/.config/nvim/lua/plugins/symbols-outline.lua &&

## (optional)Install plugins.
echo 'Install all the vim plugins? (Y or N)\n'
ANS=''
read ANS

if [ "$ANS" = "Y" ];then
    nvim +PackerInstall &&
    nvim +PackerCompile &&
		ln -s ${DIR}/vim/colorscheme/dia.lua ~/.local/share/nvim/site/pack/packer/start/lualine.nvim/lua/lualine/themes/dia.lua &&
    nvim +NightfoxCompile +qall
fi

if [ "$?" -ne 0 ];then
	echo "Config failed.\n"
	exit 1
fi

######## ZSH #########
ln -s ${DIR}/zsh/.zshrc ~/.zshrc &&
ln -s ${DIR}/zsh/.zshrc.local ~/.zshrc.local &&

######## Tmux #########
ln -s ${DIR}/tmux/.tmux.conf ~/.tmux.conf &&

######## Git #########
ln -s ${DIR}/git/.gitconfig ~/.gitconfig &&
if [ ! -f ~/.gitconfig.local ]; then
		cp ${DIR}/git/.gitconfig.local ~/.gitconfig.local
fi

######## Shell #########
mkdir -p ~/bin &&
ln -s ${DIR}/sh-util/create-venv.sh ~/bin/create-venv.sh &&

echo "\n\nCofig all done!\n"
