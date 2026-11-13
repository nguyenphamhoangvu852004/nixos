{ config, pkgs, ... }:

{
  imports = [
    ./dotfiles/gitconfig.nix

  ];

  home.username = "nguyenvu";
  home.homeDirectory = "/home/nguyenvu";

  home.stateVersion = "26.05";

  xdg.configFile = {
    "nvim".source = ./dotfiles/nvim;
    "fastfetch".source = ./dotfiles/fastfetch;
    "htop".source = ./dotfiles/htop;
  };

  home.file = {
    ".ideavimrc".source = ../../../nixos/home/dotfiles/ideavimrc;
  };
}
