{ config, pkgs, ... }: {
  services.nginx = {
    enable = true;
    upstreams."backend" = {
      servers = {
        "127.0.0.1:2233" = { };
        "127.0.0.1:2244" = { };
      };
    };

    virtualHosts."localhost" = {
      locations."/" = {
        proxyPass = "http://backend";
      };
    };
  };
}
