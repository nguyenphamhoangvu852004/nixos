{ ... }: {
  programs.zsh = {
    enable = true;
    interactiveShellInit = ''
      export PATH="$HOME/.local/bin:$PATH"

      fastfetch
    '';
    enableCompletion = true;
    autosuggestions = {
      enable = true;
    };
    syntaxHighlighting = {
      enable = true;
    };
    enableLsColors = true;
  };
}
