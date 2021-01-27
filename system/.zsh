# ZSH
export ZSH=$HOME/.oh-my-zsh

export ZSH_THEME="spaceship"
export SPACESHIP_CHAR_SYMBOL="❯"
export SPACESHIP_CHAR_SUFFIX=(" ")
export SPACESHIP_BATTERY_SHOW=false
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE="30" # buffer max size for auto suggestions

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=$ZSH/custom

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=()

# Spaceship loads only sections mentioned in
# SPACESHIP_PROMPT_ORDER or SPACESHIP_RPROMPT_ORDER.
# If you think some sections might be useless for you,
# try to disable them by omitting their names in order options.
# Just comment a section if you want to disable it
SPACESHIP_PROMPT_ORDER=(
  # time        # Time stamps section (Disabled)
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  # hg            # Mercurial section (hg_branch  + hg_status)
  # package     # Package version (Disabled)
  node          # Node.js section
  # ruby          # Ruby section
  # elixir        # Elixir section
  # xcode       # Xcode section (Disabled)
  # swift         # Swift section
  golang        # Go section
  php           # PHP section
  rust          # Rust section
  haskell       # Haskell Stack section
  # julia       # Julia section (Disabled)
  # docker      # Docker section (Disabled)
  aws           # Amazon Web Services section
  venv          # virtualenv section
  conda         # conda virtualenv section
  pyenv         # Pyenv section
  dotnet        # .NET section
  # ember       # Ember.js section (Disabled)
  # kubecontext   # Kubectl context section
  terraform     # Terraform workspace section
  exec_time     # Execution time
  line_sep      # Line break
  battery       # Battery level and status
  # vi_mode     # Vi-mode indicator (Disabled)
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)

ln -sf $ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme $ZSH_CUSTOM/themes/spaceship.zsh-theme
source $ZSH/oh-my-zsh.sh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh # zsh plugin - Syntax highlighting
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh # zsh plugin - auto suggestions
