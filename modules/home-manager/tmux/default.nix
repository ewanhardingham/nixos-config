{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    keyMode = "vi";
    mouse = true;
    prefix = "C-space";
    plugins = with pkgs; [
      { plugin  = tmuxPlugins.vim-tmux-navigator; }
    ];
    extraConfig = ''
	set-option -sa terminal-overrides ",xterm-256color:RGB"
	bind -n M-H previous-window
	bind -n M-L next-window
	bind '"' split-window -v -c "#{pane_current_path}"
	bind % split-window -h -c "#{pane_current_path}"
	bind-key -T copy-mode-vi "v" send -X begin-selection
	bind-key -T copy-mode-vi "y" send -X copy-selection
    '';
    terminal = "screen-256color";
  };
}
