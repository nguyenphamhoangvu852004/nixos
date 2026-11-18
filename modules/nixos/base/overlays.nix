
{ config, pkgs, ... }:{

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