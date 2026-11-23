{
  config,
  pkgs,
  pkgs-unstable,
  ...
}:
{
  # List packages installed in system profile.
  # You can use https://search.nixos.org/ to find more packages (and options).
  environment.sessionVariables = {
    GTK_IM_MODULE = "fcitx";
    QT_IM_MODULE = "fcitx";
    XMODIFIERS = "@im=fcitx";
    SDL_IM_MODULE = "fcitx";
    GLFW_IM_MODULE = "ibus";
  };
  environment.shellAliases = {
    checkpower = "upower -i /org/freedesktop/UPower/devices/line_power_ACAD | grep online";
  };

  environment.systemPackages = with pkgs; [
    stow
    lazygit
    tealdeer
    tmux
    eza
    lazydocker
    oh-my-posh
    alacritty
    kdePackages.kamoso
    pkgs-unstable.chatgpt
    adwaita-icon-theme
    corefonts
    vista-fonts
    # home-manager
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
    openjdk21
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
    (pkgs.discord.override {
      commandLineArgs = "--ozone-platform=x11";
    })
  ];
}
