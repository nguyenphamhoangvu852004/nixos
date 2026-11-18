{ config, pkgs, ... }:
{
  # docker engine
  virtualisation.docker = {
    enable = true;
  };
}
