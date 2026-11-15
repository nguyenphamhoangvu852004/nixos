{ pkgs, ... }: {
  programs.zsh.enable = true;
  programs.oh-my-posh = {
    enable = true;
    package = pkgs.oh-my-posh;
    enableZshIntegration = true;
    useTheme = "amro";
  };
}
