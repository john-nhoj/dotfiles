DOT_FILES = .zshrc .editorconfig .hushlogin

all:
	homebrew
	zsh
	bootstrap-apple-defaults
	link

#### Symlinks

clean: $(foreach f, $(DOT_FILES), unlink-dot-file-$(f))
link: $(foreach f, $(DOT_FILES), link-dot-file-$(f))

unlink-dot-file-%: %
	echo "Remove Symlink $(HOME)/$<"
	$(RM) $(HOME)/$<

link-dot-file-%: %
	echo "Create Symlink $< => $(HOME)/$<"
	ln -snf $(CURDIR)/$< $(HOME)/$<

#### Homebrew

homebrew:
	install-brew
	bootstrap-brew
	update-brew
	install-casks
	install-formulas

install-brew:
	echo "START -- Installing homebrew"
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	echo "END -- Installing homebrew"

bootstrap-brew:
	echo "START -- Bootstrapping homebrew"
	echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
	eval "$(/opt/homebrew/bin/brew shellenv)"
	echo "END -- Bootstrapping homebrew"

update-brew:
	echo "START -- Updating homebrew"
	brew update
	echo "END -- Updating homebrew"
	brew "START -- Upgrading homebrew dependencies"
	brew upgrade
	brew "END -- Upgrading homebrew dependencies"

install-casks:
	echo "START -- Installing casks"
	brew install --cask google-chrome
	brew install --cask protonvpn
	brew install --cask telegram
	brew install --cask rectangle
	brew install --cask notion
	brew install --cask slack
	brew install --cask docker
	brew install --cask figma
	brew install --cask discord
	brew install --cask jetbrains-toolbox
	brew install --cask bitwarden
	brew install --cask stats
	brew install --cask toggl-track
	echo "END -- Installing casks"

install-formulas:
	brew "START -- Installing formulas"
	brew install awscli
	brew install postgresql
	brew install yarn
	brew install watchman
	brew install node
	brew install direnv
	brew install nvm
	brew "END -- Installing formulas"

#### ZSH

zsh:
	install-zsh
	install-oh-my-zsh
	install-zsh-plugins

install-zsh:
	brew install zsh

install-oh-my-zsh:
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

install-zsh-plugins:
	@echo "START -- Installing ZSH plugins"
	@echo "ZSH_CUSTOM=${ZSH_CUSTOM}"
	brew install zsh-completions
	git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM}/plugins/zsh-autosuggestions
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting
	@echo "END -- ZSH plugins installed"

#### Git

bootstrap-git:
	git config --global core.excludesfile ~/.config/git/.gitignore
	git config --global user.name "John Cheng"
	git config --global user.email "cheng.john@pm.me"

#### Apple defaults

bootstrap-apple-defaults:
	./.macos
