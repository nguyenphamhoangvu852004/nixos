{ config, pkgs, ... }:

{
  home.username = "nguyenvu";
  home.homeDirectory = "/home/nguyenvu";

  home.stateVersion = "26.05";

  xdg.configFile = {
    "nvim".source = ./dotfiles/nvim;
  };

  # home.file = {
  #   ".gitconfig".source = ./dotfiles/git/config;
  # };
}
