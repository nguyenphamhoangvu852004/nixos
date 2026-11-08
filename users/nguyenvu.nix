
{ config, pkgs, ... }:
{
  users.users."nguyenvu" = {
    isNormalUser = true;
    description = "nguyenvu";
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
    ];
    packages = with pkgs; [
      #  thunderbird
    ];
  };
}

