{
  description = "Personal NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    pi = {
      url = "github:lukasl-dev/pi.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{
    nixpkgs,
    nixos-wsl,
    home-manager,
    ...
  }:

  let
    system = "x86_64-linux";
    username = "gabriel";

    mkHost = { modules }: nixpkgs.lib.nixosSystem {
      inherit system;

      specialArgs = {
        inherit inputs username;
      };

      modules = [
        ./modules/nixos/common

        home-manager.nixosModules.home-manager

        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;

            extraSpecialArgs = {
              inherit inputs username;
            };

            users.${username} = import ./home;
          };
        }
      ] ++ modules;
    };

  in {
    nixosConfigurations = {
      wsl = mkHost {
        modules = [
          nixos-wsl.nixosModules.default
          ./hosts/wsl
        ];
      };

      zephyrus = mkHost {
        modules = [
          ./hosts/zephyrus
        ];
      };
    };
  };
}
