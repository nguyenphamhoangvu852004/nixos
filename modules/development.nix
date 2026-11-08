
{config,pkgs,...}:
let
  unstable =
    import (builtins.fetchTarball "https://channels.nixos.org/nixos-unstable/nixexprs.tar.xz")
      {
        inherit (pkgs.stdenv.hostPlatform) system;
        config.allowUnfree = true;
      };
in
{
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
  }
