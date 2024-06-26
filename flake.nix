{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    kitty-icon.url = "github:DinkDonk/kitty-icon";
    kitty-icon.flake = false;

    nixvim.url = "github:nix-community/nixvim";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    home-manager,
    nix-darwin,
    kitty-icon,
    nixvim,
  }: let
    system = "aarch64-darwin";
  in {
    darwinConfigurations."MBP-M1" = nix-darwin.lib.darwinSystem {
      inherit system;
      specialArgs = { inherit inputs; };
      modules = [
        (import ./modules/nix-darwin "mag")
        home-manager.darwinModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.mag = import ./modules/home-manager "mag";
            extraSpecialArgs = {
              inherit self kitty-icon;
            };
          };
        }
        (import ./modules/mynixvim)
      ];

    };

    formatter."${system}" = nixpkgs.legacyPackages.${system}.alejandra;
  };
}
