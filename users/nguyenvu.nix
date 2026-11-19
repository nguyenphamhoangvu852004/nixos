{ config, pkgs, ... }:
{
  users.users."nguyenvu" = {
    isNormalUser = true;
    description = "nguyenvu";
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
      "libvirtd"
    ];
    packages = with pkgs; [
      #  thunderbird
    ];
  };
}
