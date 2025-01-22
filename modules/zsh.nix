{ config, pkgs, ... }:
let

  # Define aliases in the correct format for Home Manager
  myAliases = {
    grep = "grep --color=auto";
    update = "sudo nix-channel --update && sudo nixos-rebuild switch && home-manager switch";
    cls = "clear";
    rm = "rm -rf";
    helix = "/nix/store/q8kcnhsp0p2zs3xy00031w1plyw5n8s8-helix-24.07/bin/hx";
    cp = "cp -r";
    cs = "clear"; # clear terminal
    zshrc = "nvim ~/.zshrc";
    bashrc = "nvim ~/.bashrc";
    key = "nvim ~/.config/hypr/keybindings.conf";
    a = "nvim";
    sa = "sudo nvim";
    j = "z";
    s = "sudo";
    e = "exit";
    tar = "tar -xvf";
    ali = "nvim ~/.zshalias";
    reload = "source ~/.bashrc && clear";
    src = "source ~/.zshrc && cs";
    his = "nvim ~/.zsh_history";
    t = "tmux";
    tse = "~/.local/share/bin/tmux.sh";
    tco = "nvim ~/.config/tmux/tmux.conf";
    tns = "tmux new-session -s";
    tas = "tmux attach-session";
    tds = "tmux detach";
    tks = "tmux kill-session -t";
    sn = "sudo shutdown now";
    nvimsrc = "j ~/dotfiles/nvim/.config/nvim/lua/charchil/ && a .";
    n = "nvim .";
    lg = "lazygit";
    ghdir = "gh repo create \"$(basename \"$PWD\")\" --private --source=. --remote=origin";
    ghdirp = "gh repo create \"$(basename \"$PWD\")\" --public --source=. --remote=origin";
    memory = "echo \"valgrind --tool=massif <file_name>\\n ms_print massif.out.<pid> | nvim\"";
    hypr = "j ~/.config/hypr/ && cs";
    mx = "chmod +x";
    du = "du -sh";
    df = "df -h";
    nrb = "sudo nixos-rebuild switch";
    nixup = "nix-env -u";
    nixg = "nix-env --list-generations";
    nixclean = "nix-collect-garbage --delete-old";
    l = "eza -lh --icons=auto"; # long list
    ls = "lsd";
    ll = "eza -lha --icons=auto --sort=name --group-directories-first"; # long list all
    ld = "eza -lhD --icons=auto"; # long list dirs
    lt = "eza --icons=auto --tree"; # list folder as tree
    lhd = "ld .*";
    stop = "sudo systemctl stop";
    status = "sudo systemctl status";
    restart = "sudo systemctl restart";
    start = "sudo systemctl start";
    ".." = "cd ..";
    "..." = "cd ../..";
    ".3" = "cd ../../..";
    ".4" = "cd ../../../..";
    ".5" = "cd ../../../../..";
    mkdir = "mkdir -p";
    g = "j ~/repos";
    vb = "NVIM_APPNAME=LazyVim nvim";
    ghc = "gh repo clone";
    ghl = "gh repo list";
    project = "a ~/dotfiles/learn/contents/Project\ ideas.md";
    pc = "a ~/dotfiles/learn/contents/completed_projects.md";
    todo = "$HOME/repos/todos/make.sh && cs";
    srcgrub = "sudo grub-mkconfig -o /boot/grub/grub.cfg";
  };

in
{
  # Enable Zsh

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = myAliases; # Use the aliases list here
#promptInit = "source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";


    history = {
      append = true;
      extended = true;
      share = true;
      size = 10000;
      path = "$HOME/.zsh_history";
      ignoreAllDups = true;
    };

    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [
        "git"
        #"sudo"
        "copyfile"
        "dirhistory"
      ];
    };

    # Configure the prompt theme with Oh My Posh
    #initExtra = ''
    #  eval "$($HOME/.local/bin/oh-my-posh init zsh --config $HOME/dotfiles/oh-my-posh/themes/negligible.omp.json)"
    #'';

    # Environment variables and shell settings
  };

  # home.sessionVariables = {
  #   GEM_HOME = "$HOME/.gem";
  #   MANPAGER = "nvim +Man!";
  #   EDITOR = "nvim";
  # };

  programs.oh-my-posh = {
    enable = false;
    enableZshIntegration = false;
    #useTheme = "negligible";
  };

  # Define functions in your configuration directly in .zshrc
  home.file = {
    ".zshrc".text = ''


source $HOME/.local/share/bin/_zsh-completions

  source $HOME/.config/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
   [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

      # Install packages from Nixpkgs Unstable (function niu)
      function niu() {
        package_list=""
        for arg in "$@"; do
          package_list+="nixos-unstable.$arg "
        done
        package_list=$(echo $package_list | xargs)
        eval nix-env -iA $package_list
      }

      # Install packages from Nixos (function ni)
      function ni() {
        package_list=""
        for arg in "$@"; do
          package_list+="nixos.$arg "
        done
        package_list=$(echo $package_list | xargs)
        eval nix-env -iA $package_list
      }

      # Remove packages (function nr)
      function nr(){
        package_list=""
        for arg in "$@"; do 
          package_list+="$arg "
        done
        package_list=$(echo $package_list | xargs)
        eval nix-env -e $package_list
      }

      # List installed packages (function nixl)
      function nixl(){
        nix-env -q
      }

      # Clone repositories (functions cgh, cg, cgd, cgdh)
      function cgh(){
        git clone $1
      }

      function cg(){
        git clone https://github.com/$1
      }

      function cgd(){
        git clone --depth 1 https://github.com/$1
      }

      function cgdh(){
        git clone --depth 1 $1
      }

      # Bun environment variables (if using Bun package manager)
      [ -s "/home/viola/.bun/_bun" ] && source "/home/viola/.bun/_bun"
      export BUN_INSTALL="$HOME/.bun"
      export PATH="$BUN_INSTALL/bin:$PATH"



# vim mode
bindkey -v
#export KEYTIMEOUT=3 



# Function to paste from the clipboard in normal mode
function vi-paste-clipboard() {
    local content=$(wl-paste) # Get the clipboard content
    LBUFFER+="$content" # Append it to the left buffer (where command is typed)
}

# Bind the function to the 'p' key in Vim mode
zle -N vi-paste-clipboard
#bindkey -M viins 'p' vi-paste-clipboard  # In insert mode
bindkey -M vicmd 'p' vi-paste-clipboard  # In command mode
#bindkey -M vicmd '^[[15~' vi-paste-clipboard

# Change cursor to a box in insert mode
zle -N zle-line-init
zle -N zle-keymap-select

function zle-line-init() {
  # Set the cursor to a box in insert mode
  echo -ne '\033[0 q'
}

function zle-keymap-select() {
  if [[ $KEYMAP == vicmd ]]; then
    # Set cursor to a block (box) in normal mode
    echo -ne '\033[2 q'
  else
    # Set cursor to a box in insert mode
    echo -ne '\033[0 q'
  fi
}


function condas() {
  # List conda environments and use fzf to select one
  local env_name
  env_name=$(conda env list | awk '{if(NR>3) print $1}' | fzf --height 40% --reverse --border)

  # Check if an environment was selected
  if [[ -n "$env_name" ]]; then
    # Activate the selected conda environment
    conda activate "$env_name"
    
    # Open Neovim in the current directory
    nvim .
  else
    echo "No environment selected."
  fi
}

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/viola/.conda/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/viola/.conda/etc/profile.d/conda.sh" ]; then
        . "/home/viola/.conda/etc/profile.d/conda.sh"
    else
        export PATH="/home/viola/.conda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

    '';
  };

  # Enable FZF
  programs.fzf = {
    enable = true;
  };

  programs.zoxide = {
    enable = true;
  };

  # Enable Home Manager to manage shell environment
  home.packages = with pkgs;[
    zsh
    zsh-autosuggestions
    zsh-syntax-highlighting
    zoxide
    fzf
    fd
    nix-zsh-completions
  ];

  # Enable bash completion (optional for other programs like `bun`, etc.)
  programs.bash.enableCompletion = true;
}
