{
  description = "Nguyen Vu NixOS Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zalo-for-linux = {
      url = "github:VN-Linux-Family/zalo-for-linux";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    yazi.url = "github:sxyazi/yazi";
  };

  outputs =
    { self
    , nixpkgs
    , nixpkgs-unstable
    , home-manager
    , zalo-for-linux
    , yazi
    , ...
    }@inputs:
    let
      system = "x86_64-linux";
      pkgs-unstable = import nixpkgs-unstable {
        inherit system;
        config.allowUnfree = true;
      };
    in
    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs pkgs-unstable; };
        modules = [
          home-manager.nixosModules.home-manager
          zalo-for-linux.nixosModules.default
          ({ pkgs, ... }: {
            environment.systemPackages = [
              (yazi.packages.${pkgs.stdenv.hostPlatform.system}.default.override {
                _7zz = pkgs._7zz-rar; # Support for RAR extraction
              })
            ];
          })
          ./hosts/nixos/default.nix
        ];
      };
    };
}
