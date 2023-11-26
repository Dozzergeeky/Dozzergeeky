# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="random"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,

#see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(1password)
plugins=(asdf)
plugins=(autojump)
plugins=(autopep8)
plugins=(bbedit)
plugins=(bedtools)
plugins=(bgnotify)
plugins=(bower)
plugins=(branch)
plugins=(brew)
plugins=(bridgetown)
plugins=(bun)
plugins=(bundler)
plugins=(cabal)
plugins=(chruby)
plugins=(chucknorris)
plugins=(command-not-found)
plugins=(compleat)
plugins=(copybuffer)
plugins=(copyfile)
plugins=(copypath)
plugins=(cp)
plugins=(dirhistory)
plugins=(dirpersist)
plugins=(dnf)
plugins=(dnote)
plugins=(extract)
plugins=(fancy-ctrl-z)
plugins=(fasd)
plugins=(geeknote)
plugins=(genpass)
plugins=(gh)
plugins=(git)
plugins=(git-auto-fetch)
plugins=(git-commit)
plugins=(git-escape-magic)
plugins=(git-extras)
plugins=(gitfast)
plugins=(git-flow)
plugins=(git-flow-avh)
plugins=(github)
plugins=(git-hubflow)
plugins=(gitignore)
plugins=(git-lfs)
plugins=(git-prompt)
plugins=(glassfish)
plugins=(gnu-utils)
plugins=(history)
plugins=(history-substring-search)
plugins=(hitchhiker)
plugins=(httpie)
plugins=(invoke)
plugins=(jump)
plugins=(kate)
plugins=(keychain)
plugins=(kind)
plugins=(last-working-dir)
plugins=(lein)
plugins=(lighthouse)
plugins=(lol)
plugins=(lxd)
plugins=(magic-enter)
plugins=(man)
plugins=(marked2)
plugins=(marktext)
plugins=(mercurial)
plugins=(meteor)
plugins=(microk8s)
plugins=(minikube)
plugins=(nanoc)
plugins=(nmap)
plugins=(node)
plugins=(nodenv)
plugins=(nomad)
plugins=(npm)
plugins=(nvm)
plugins=(per-directory-history)
plugins=(pip)
plugins=(pipenv)
plugins=(podman)
plugins=(poetry)
plugins=(poetry-env)
plugins=(powify)
plugins=(pre-commit)
plugins=(profiles)
plugins=(pyenv)
plugins=(pylint)
plugins=(python)
plugins=(qrcode)
plugins=(react-native)
plugins=(rebar)
plugins=(repo)
plugins=(ros)
plugins=(rsync)
plugins=(rtx)
plugins=(safe-paste)
plugins=(shell-proxy)
plugins=(shrink-path)
plugins=(sigstore)
plugins=(skaffold)
plugins=(sublime)
plugins=(sudo)
plugins=(supervisor)
plugins=(suse)
plugins=(systemadmin)
plugins=(systemd)
plugins=(taskwarrior)
plugins=(terminitor)
plugins=(term_tab)
plugins=(terraform)
plugins=(textastic)
plugins=(textmate)
plugins=(thefuck)
plugins=(themes)
plugins=(thor)
plugins=(tig)
plugins=(timer)
plugins=(tmux)
plugins=(tmux-cssh)
plugins=(tmuxinator)
plugins=(toolbox)
plugins=(torrent)
plugins=(transfer)
plugins=(tugboat)
plugins=(ubuntu)
plugins=(universalarchive)
plugins=(urltools)
plugins=(vim-interaction)
plugins=(vi-mode)
plugins=(volta)
plugins=(vscode)
plugins=(vundle)
plugins=(wakeonlan)
plugins=(wd)
plugins=(web-search)
plugins=(wp-cli)
plugins=(zoxide)
plugins=(/asdsdf)
plugins=(zsh-interactive-cd)
plugins=(zsh-navigation-tools)
plugins() {
    return [
        "adb",
        "ag",
        "aliases",
        "zsh-interactive-cd"
    ];
}
source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

if [ -e /home/dozzer/.nix-profile/etc/profile.d/nix.sh ]; then . /home/dozzer/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
