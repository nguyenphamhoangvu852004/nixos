{ config
, pkgs
, pkgs-unstable
, ...
}:
{

  # Select internationalisation properties.
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  #fcitx lotus
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5.addons = [ pkgs-unstable.fcitx5-lotus ];
  };

  systemd.packages = [ pkgs-unstable.fcitx5-lotus ];
  systemd.services."fcitx5-lotus-server@nguyenvu" = {
    wantedBy = [ "multi-user.target" ];
    overrideStrategy = "asDropin";
    serviceConfig = {
      User = "root";
    };
  };

  # Set your time zone.
  time.timeZone = "Asia/Ho_Chi_Minh";

  # Use GNOME with its Wayland session through GDM.
  services.displayManager.gdm.enable = true;
  # services.desktopManager.gnome.enable = true;
  #  Nguyeenx Phamj H

  # Use KDE with its Wayland session through GDM.
  services.desktopManager.plasma6.enable = true;

  # Configure keymap in X11
  services.xserver = {
    enable = false;
    xkb = {
      layout = "us";
      variant = "";
    };
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # config swap
  zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryPercent = 50;
    priority = 100;
  };
}
