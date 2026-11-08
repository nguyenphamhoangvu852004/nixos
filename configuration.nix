# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, pkgs, ... }:

let
  unstable =
    import (builtins.fetchTarball "https://channels.nixos.org/nixos-unstable/nixexprs.tar.xz")
      {
        inherit (pkgs.stdenv.hostPlatform) system;
        config.allowUnfree = true;
      };
in

{

  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  networking.firewall.interfaces."docker0" = {
    allowedTCPPorts = [
      8080
      8081
      8082
      8083
      8084
      8085
    ];
  };

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Ho_Chi_Minh";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

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

  #ibus bamboo
  i18n.inputMethod = {
    enabled = "ibus";
    ibus.engines = with pkgs.ibus-engines; [
      bamboo
    ];
  };

  # Enable the GNOME Desktop Environment.
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    # jack.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;

  # docker engine
  virtualisation.docker = {
    enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
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

  programs.nix-ld.enable = true;

  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # nixpkgs.config.allowUnsupportedSystem = true;

  hardware.graphics = {
    enable = true;
    enable32Bit = true; # Hữu ích cho Steam/Wine
  };

  services.xserver.videoDrivers = [
    "amdgpu"
    "nvidia"
  ];

  hardware.nvidia = {
    modesetting.enable = true;

    # GTX 1650 thuộc Turing, hỗ trợ NVIDIA open kernel modules.
    open = true;

    nvidiaSettings = true;

    prime = {
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };

      # THAY bằng địa chỉ GPU thực tế của bạn.
      amdgpuBusId = "PCI:5:0:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };

  # config swap
  zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryPercent = 50;
    priority = 100;
  };

  # List packages installed in system profile.
  # You can use https://search.nixos.org/ to find more packages (and options).
  environment.shellAliases = {
    checkpower = "upower -i /org/freedesktop/UPower/devices/line_power_ACAD | grep online";
  };

  environment.systemPackages = with pkgs; [
    unstable.chatgpt
    discord
    telegram-desktop
    vegeta
    wpsoffice-cn
    mindustry
    postman
    git
    github-cli
    vlc
    neovim
    google-chrome
    vscode
    jetbrains.idea
    jetbrains.datagrip
    drawio
    codex
    jdk21
    nodejs_24
    pnpm
    python314
    maven
    obsidian
    dotnet-sdk_11
    gcc
    gnutar
    cargo
    gnumake
    pkg-config
    go
    curl
    wget
    unzip
    jq
    ripgrep
    gradle
    lua52Packages.tree-sitter-cli
    lua55Packages.fzf-lua
    fastfetch
    htop
    btop
    fzf
    (pkgs.symlinkJoin {
      name = "obs-studio-with-nvidia";

      paths = [ pkgs.obs-studio ];
      nativeBuildInputs = [ pkgs.makeWrapper ];

      postBuild = ''
        wrapProgram "$out/bin/obs" \
          --prefix LD_LIBRARY_PATH : /run/opengl-driver/lib
      '';
    })

  ];

  services.cloudflare-warp.enable = true;

  services.flatpak.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "26.05"; # Did you read the comment?
  nixpkgs.overlays = [
    (final: prev: {
      ibus-engines = prev.ibus-engines // {
        bamboo = prev.ibus-engines.bamboo.overrideAttrs (old: {
          postInstall = (old.postInstall or "") + ''
            mkdir -p $out/lib/ibus-bamboo
            ln -s $out/share/ibus-bamboo/data $out/lib/ibus-bamboo/data
          '';
        });
      };
    })
  ];

}
