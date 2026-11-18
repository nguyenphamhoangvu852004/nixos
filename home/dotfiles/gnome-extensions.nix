{ ... }:
{
  # Persist GNOME Shell extension state and preferences with Home Manager.
  dconf.enable = true;

  dconf.settings = {
    "org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = [
        "Resource_Monitor@Ory0n"
        "clipboard-indicator@tudmotu.com"
        "media-controller@naimur"
        "appindicatorsupport@rgcjonas.gmail.com"
        "status-icons@gnome-shell-extensions.gcampax.github.com"
      ];
    };

    "org/gnome/shell/extensions/resource-monitor" = {
      cpucolors = [
        "65 0.9647058844566345 0.8274509906768799 0.1764705926179886"
        "80 1 0.47058823704719543 0"
        "92 0.8784313797950745 0.10588235408067703 0.1411764770746231"
      ];
      cpufrequencycolors = [ ];
      cpuloadaveragecolors = [ ];
      diskdevicesdisplayall = false;
      diskdeviceslist = [
        ''{"version":2,"type":"disk","device":"/dev/nvme0n1p2","stableId":"/dev/disk/by-uuid/4c874a22-2bae-41b4-a665-4f5c59dafbd5","mountPoint":"/","stats":false,"space":false,"displayName":"/dev/nvme0n1p2"}''
        ''{"version":2,"type":"disk","device":"/dev/nvme0n1p2","stableId":"/dev/disk/by-uuid/4c874a22-2bae-41b4-a665-4f5c59dafbd5","mountPoint":"/nix/store","stats":false,"space":false,"displayName":"/dev/nvme0n1p2"}''
        ''{"version":2,"type":"disk","device":"/dev/nvme0n1p1","stableId":"/dev/disk/by-uuid/3A62-A367","mountPoint":"/boot","stats":false,"space":false,"displayName":"/dev/nvme0n1p1"}''
      ];
      diskshowdevicename = false;
      diskspacecolors = [
        "0 0.8784313797950745 0.10588235408067703 0.1411764770746231"
        "15 1 0.47058823704719543 0"
        "30 0.9647058844566345 0.8274509906768799 0.1764705926179886"
        "50 0.18039216101169586 0.7607843279838562 0.4941176474094391"
      ];
      diskspacestatus = false;
      diskstatscolors = [ ];
      diskstatsstatus = false;
      displaymode = "primary";
      extensionposition = "left";
      gpucolors = [
        "65 0.9647058844566345 0.8274509906768799 0.1764705926179886"
        "80 1 0.47058823704719543 0"
        "92 0.8784313797950745 0.10588235408067703 0.1411764770746231"
      ];
      gpudecimals = 1;
      gpudeviceslist = [
        ''{"version":2,"type":"gpu","device":"GPU-c58c2d45-fed6-3d43-e654-9a9ff58da017","name":"NVIDIA GeForce GTX 1650","usage":true,"memory":false,"displayName":"NVIDIA GeForce GTX 1650"}''
        ''{"version":2,"type":"gpu","device":"amd:card2","name":"AMD GPU 0x164c","usage":true,"memory":false,"displayName":"AMD GPU 0x164c"}''
      ];
      gpudisplaydevicename = false;
      gpumemorycolors = [ ];
      gpumemorydecimals = 1;
      gpumemorymonitor = "used";
      gpumemoryunit = "perc";
      gpurendermode = "precise";
      gpustatus = true;
      gpuwidth = 0;
      iconsstatus = true;
      itemsposition = [ "cpu" "ram" "swap" "stats" "space" "eth" "wlan" "gpu" ];
      leftclickstatus = "gnome-system-monitor";
      netautohidestatus = true;
      netethcolors = [ ];
      netethstatus = true;
      netwlancolors = [ ];
      netwlanstatus = false;
      ramalert = false;
      ramcolors = [
        "65 0.9647058844566345 0.8274509906768799 0.1764705926179886"
        "80 1 0.47058823704719543 0"
        "92 0.8784313797950745 0.10588235408067703 0.1411764770746231"
      ];
      ramdecimals = 1;
      rammonitor = "used";
      ramstatus = true;
      ramunit = "numeric";
      secondaryseparatorstyle = "brackets";
      swapcolors = [
        "65 0.9647058844566345 0.8274509906768799 0.1764705926179886"
        "80 1 0.47058823704719543 0"
        "92 0.8784313797950745 0.10588235408067703 0.1411764770746231"
      ];
      swaprendermode = "precise";
      swapstatus = true;
      swapunitmeasure = "auto";
      thermalcpucolors = [ ];
      thermalcputemperaturedeviceslist = [
        ''{"version":2,"type":"thermal-cpu","name":"k10temp: Tctl","monitor":false,"path":"/sys/class/hwmon/hwmon3/temp1_input"}''
      ];
      thermalgpucolors = [ ];
      thermalgputemperaturedeviceslist = [
        ''{"version":2,"type":"thermal-gpu","device":"GPU-c58c2d45-fed6-3d43-e654-9a9ff58da017","name":"NVIDIA GeForce GTX 1650","monitor":false}''
        ''{"version":2,"type":"thermal-gpu","device":"amd:card2","name":"AMD GPU 0x164c","monitor":false}''
      ];
    };

    "org/gnome/shell/extensions/clipboard-indicator" = {
      enable-keybindings = true;
      preview-size = 40;
    };

    "org/gnome/shell/extensions/media-controller" = {
      card-art-size = "large";
      controls-on-left = true;
      hide-when-inactive = true;
      last-announced-version = "3.4";
      lyrics-height = 320;
      lyrics-online-lookup = true;
      panel-position = "right";
      panel-text-width = 150;
      scroll-direction = "right-to-left";
      show-artist = false;
      show-loop = false;
      show-next = true;
      show-player-icon = false;
      show-previous = true;
      show-seek-backward = true;
      show-seek-forward = true;
      show-shuffle = true;
      show-title = true;
    };

    "org/gnome/shell/extensions/appindicator" = {
      compact-mode-enabled = true;
      icon-brightness = 0.0;
      icon-contrast = 0.0;
      icon-opacity = 240;
      icon-saturation = 0.0;
      icon-size = 0;
      tray-pos = "right";
    };

    # Preferences from the dump are retained even while these extensions are
    # disabled, so they are ready if the extensions are enabled again.
    "org/gnome/shell/extensions/logo-menu" = {
      menu-button-icon-image = 18;
      menu-button-terminal = "kgx";
      symbolic-icon = false;
      use-custom-icon = false;
    };

    "org/gnome/shell/extensions/blur-my-shell" = {
      settings-version = 10;
    };
    "org/gnome/shell/extensions/blur-my-shell/popup" = {
      screenshot-corner-radius = 36;
    };

    "org/gnome/shell/extensions/dash-to-dock" = {
      apply-custom-theme = false;
      background-opacity = 0.8;
      custom-theme-shrink = true;
      dash-max-icon-size = 48;
      dock-position = "BOTTOM";
      height-fraction = 1.0;
      preferred-monitor = -2;
      preferred-monitor-by-connector = "eDP-1";
    };

    "org/gnome/shell/extensions/lockscreen-extension" = {
      backgrounds-folder-path = "/home/nguyenvu/Pictures";
      hide-lockscreen-extension-button = true;
    };
  };
}
