{ config, pkgs, ... }:

{
  imports = [
    ./dotfiles/gitconfig.nix
    ./dotfiles/alacritty.nix
    ./dotfiles/ohmyposh.nix
  ];

  home.username = "nguyenvu";
  home.homeDirectory = "/home/nguyenvu";

  home.stateVersion = "26.05";

  home.pointerCursor = {
    name = "Adwaita";
    package = pkgs.adwaita-icon-theme;
    size = 24;
    gtk.enable = true;
    x11.enable = true;
  };

  xdg.configFile = {
    "nvim".source = ./dotfiles/nvim;
    "fastfetch".source = ./dotfiles/fastfetch;
    "htop".source = ./dotfiles/htop;
  };

  home.file = {
    ".ideavimrc".source = ./dotfiles/ideavimrc;
  };

  # Fuzzy finder
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  # Smarter cd
  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };
}
