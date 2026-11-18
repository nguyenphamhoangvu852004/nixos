{ pkgs, ... }:

{
  programs.alacritty = {
    enable = true;
    package = pkgs.alacritty;

    settings = {
      general = {
        live_config_reload = true;
      };

      window = {
        dimensions = {
          columns = 120;
          lines = 35;
        };

        padding = {
          x = 10;
          y = 10;
        };

        dynamic_padding = true;
        decorations = "Full";
        opacity = 0.95;
      };

      font = {
        size = 12.0;

        normal = {
          family = "JetBrainsMono Nerd Font";
          style = "Regular";
        };

        bold = {
          family = "JetBrainsMono Nerd Font";
          style = "Bold";
        };
      };

      cursor = {
        style = {
          shape = "Block";
          blinking = "Off";
        };
      };

      terminal = {
        shell = {
          program = "${pkgs.zsh}/bin/zsh";
        };
      };
    };
  };
}
