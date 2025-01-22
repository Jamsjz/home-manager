{ config, lib, pkgs, ... }:


# let 
# tmux-resurrect = pkgs.tmuxPlugins.mkTmuxPlugin 
# {
#
# pluginName = "tmux-resurrect";
# version = "";
# src = pkgs.fetchFromGitHub {
# owner = "tmux-plugins";
# repo = "tmux-resurrect";
#
#
# };
#
#
# };
#
# in 
{

  programs.tmux = {
    enable = true;
    escapeTime = 0;
    secureSocket = true;
    newSession = false;
    keyMode = "vi";
    historyLimit = 5000;
    baseIndex = 0;
    clock24 = false;
 customPaneNavigationAndResize = false;
 #description = "Override the hjkl and HJKL bindings for pane navigation and resizing in VI mode.";

 terminal = "kitty";

#extraConfigBeforePlugins = '' '';

#description = ''Additional contents of /etc/tmux.conf, to be run before sourcing plugins. '';

    extraConfig = ''
      # split window horizontally or vertically in session
      bind h split-window -h
      bind v split-window -v

      # Toggle status bar visibility
      bind b if '[ "$(tmux show-option -gqv status)" = "off" ]' \
          'set-option -g status on' \
          'set-option -g status off'

      bind k kill-window

      # status bar position
      set-option -g status-position top
      #set-option -sg escape-time 10

      #detach options
      set-option -g detach-on-destroy off

      #set binding for switching to next session
      bind -n M-J switch-client -n
      bind -n M-K switch-client -p

      bind i send-keys C-l

      #set mouse support 
      set -g mouse on

      #set vim-mode
      #set-window-option -g mode-keys vi
      # bind-key -n C-v copy-mode
      bind-key o copy-mode

      #keybinding 
      bind-key -T copy-mode-vi v send-keys -X begin-selection
      # bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
      bind-key -T copy-mode-vi y send-keys -X copy-selection


      # smart pane switch with vim navigator 
      is_vim="ps -o state= -o comm= -t '#{pane_tty}' \
          | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|l?n?vim?x?|fzf)(diff)?$'"
      bind-key -n 'C-h' if-shell "$is_vim" 'send-keys C-h'  'select-pane -L'
      bind-key -n 'C-j' if-shell "$is_vim" 'send-keys C-j'  'select-pane -D'
      bind-key -n 'C-k' if-shell "$is_vim" 'send-keys C-k'  'select-pane -U'
      bind-key -n 'C-l' if-shell "$is_vim" 'send-keys C-l'  'select-pane -R'
      tmux_version='$(tmux -V | sed -En "s/^tmux ([0-9]+(.[0-9]+)?).*/\1/p")'
      if-shell -b '[ "$(echo "$tmux_version < 3.0" | bc)" = 1 ]' \
          "bind-key -n 'C-\\' if-shell \"$is_vim\" 'send-keys C-\\'  'select-pane -l'"
      if-shell -b '[ "$(echo "$tmux_version >= 3.0" | bc)" = 1 ]' \
          "bind-key -n 'C-\\' if-shell \"$is_vim\" 'send-keys C-\\\\'  'select-pane -l'"
      bind-key -T copy-mode-vi 'C-h' select-pane -L
      bind-key -T copy-mode-vi 'C-j' select-pane -D
      bind-key -T copy-mode-vi 'C-k' select-pane -U
      bind-key -T copy-mode-vi 'C-l' select-pane -R
      bind-key -T copy-mode-vi 'C-\' select-pane -l

      # #Tmux Default Shell
      #set-option -g default-shell /usr/bin/zsh


      #open panes in current directory 
      bind '"' split-window -v -c "#{pane_current_path}"
      bind % split-window -h -c "#{pane_current_path}"

      unbind r 
      bind r source-file ~/.config/tmux/tmux.conf


      # set prefix key to shift + space
      unbind C-b
      set -g prefix C-Space
      bind C-Space send-prefix 

      # shift alt vim keys to switch windows 
      bind -n M-H previous-window
      bind -n M-L next-window

      #custom plugins test for tmux
      set -g @plugin 'tmux-plugins/tpm'
      set -g @plugin 'tmux-plugins/tmux-resurrect'
      set -g @plugin 'sainnhe/tmux-fzf'
      set -g @resurrect-strategy-vim 'session'

      # design tweaks
      # # don't do anything when a 'bell' rings
      set -g visual-activity off
      set -g visual-bell off
      set -g visual-silence off
      setw -g monitor-activity off
      set -g bell-action none

      ## COLORSCHEME: gruvbox dark (medium)
      set-option -g status "on"

      # default statusbar color
      set-option -g status-style bg=colour237,fg=colour223 # bg=bg1, fg=fg1

      # default window title colors
      set-window-option -g window-status-style bg=colour214,fg=colour237 # bg=yellow, fg=bg1

      # default window with an activity alert
      set-window-option -g window-status-activity-style bg=colour237,fg=colour248 # bg=bg1, fg=fg3

      # active window title colors
      set-window-option -g window-status-current-style bg=red,fg=colour237 # fg=bg1

      # pane border
      set-option -g pane-active-border-style fg=colour250 #fg2
      set-option -g pane-border-style fg=colour237 #bg1

      # message infos
      set-option -g message-style bg=colour239,fg=colour223 # bg=bg2, fg=fg1

      # writing commands inactive
      set-option -g message-command-style bg=colour239,fg=colour223 # bg=fg3, fg=bg1

      # pane number display
      set-option -g display-panes-active-colour colour250 #fg2
      set-option -g display-panes-colour colour237 #bg1

      # clock
      set-window-option -g clock-mode-colour colour109 #blue

      # bell
      set-window-option -g window-status-bell-style bg=colour167,fg=colour235 # bg=red, fg=bg

      ## Theme settings mixed with colors (unfortunately, but there is no cleaner way)
      set-option -g status-justify "left"
      set-option -g status-left-style none
      set-option -g status-left-length "80"
      set-option -g status-right-style none
      set-option -g status-right-length "80"
      set-window-option -g window-status-separator ""

      set-option -g status-left "#[bg=colour241,fg=colour248] #S#[bg=colour237,fg=colour241,nobold,noitalics,nounderscore]"
      set-option -g status-right "#[bg=colour237,fg=colour239 nobold, nounderscore, noitalics]#[fg=white]#(pwd)'#[bg=colour239,fg=colour246] %m/%d %I:%M %p #[bg=colour239,fg=colour248,nobold,noitalics,nounderscore]#[bg=colour248,fg=colour237]#h"

      set-window-option -g window-status-current-format "#[bg=colour013,fg=colour237,bold,noitalics,nounderscore]#[bg=colour013,fg=colour236] #I #[bg=colour013,fg=colour239,bold] #W#{?window_zoomed_flag,*Z,} #[bg=colour237,fg=colour013,nobold,noitalics,nounderscore]"
      set-window-option -g window-status-format "#[bg=colour239,fg=colour237,noitalics]#[bg=colour239,fg=colour223] #I #[bg=colour239,fg=colour223] #W #[bg=colour237,fg=colour239,noitalics]"


      bind f run-shell '~/.local/share/bin/tmux.sh'


      run '~/.config/tmux/plugins/tpm/tpm'
    '';
  };

}
