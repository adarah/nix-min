{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nixpkgs, home-manager, nix-darwin }: 
  let
    system = "aarch64-darwin";
  in {
    darwinConfigurations."MBP-M1" = nix-darwin.lib.darwinSystem {
      inherit system;
      pkgs = import nixpkgs { inherit system; };
      modules = [
        ./modules/nix-darwin
        home-manager.darwinModules.home-manager {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.mag = import ./modules/home-manager;
            extraSpecialArgs =  {
              inherit self;
            };
          };
        }
      ];
    };
  };
}
