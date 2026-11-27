{pkgs, ...}:
{
    programs.tmux = {
        enable = true;
        package = pkgs.tmux;

        prefix = "C-a";
        mouse = true;
        terminal = "screen-256color";
        keyMode = "vi";

        extraConfig = ''
          # Default configs
          unbind r
          unbind q
          unbind C-b

          bind r source-file "#{TMUX_CONF}" \; display "Reloaded!"

          bind _ split-window -h
          bind - split-window -v

          # Colors
          set -g status-bg '#161616'
          set -g status-fg '#6666ff'

          set -g pane-active-border-style bg=default,fg='#323232'
          set -g pane-border-style fg=red

          set -g message-style bg=default,fg=green

          # Sessions
          bind C-c new-session
          bind C-f command-prompt -p find-session 'switch-client -t %%'
          bind BTab switch-client -l

          # Panes
          bind h select-pane -L
          bind j select-pane -D
          bind k select-pane -U
          bind l select-pane -R

          bind q confirm-before kill-pane

          bind > swap-pane -D
          bind < swap-pane -U

          bind -r H resize-pane -L 2
          bind -r J resize-pane -D 2
          bind -r K resize-pane -U 2
          bind -r L resize-pane -R 2

          bind + resize-pane -Z

          # Windows
          unbind n
          unbind p

          bind -r C-h previous-window
          bind -r C-l next-window

          bind -r C-S-H swap-window -t -1 \; select-window -t -1
          bind -r C-S-L swap-window -t +1 \; select-window -t +1

          bind Tab last-window
        '';
    };
}
