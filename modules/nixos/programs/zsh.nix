{ pkgs, ... }: {
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
  # programs.oh-my-posh = {
  #   enable = true;
  #   package = pkgs.oh-my-posh;
  #   enableZshIntegration = true;
  #   useTheme = "amro";
  # };
}
