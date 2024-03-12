{
  description = "ewanhardingham's NixOS Flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    mac-app-util.url = "github:hraban/mac-app-util";
  };

  outputs = { self, nixpkgs, home-manager, nixvim, nix-darwin, mac-app-util, ... }:
    let
      lib = nixpkgs.lib;
    in {
    nixosConfigurations = {
      loom = lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ ./hosts/loom/configuration.nix ];
      };
    };
    darwinConfigurations = {
      "endurance" = nix-darwin.lib.darwinSystem {
        modules = [ ./hosts/endurance/configuration.nix mac-app-util.darwinModules.default ];
      };
    };
    darwinPackages = self.darwinConfigurations."endurance".pkgs;
    homeConfigurations = {
      "ewan@loom" = home-manager.lib.homeManagerConfiguration {
	pkgs = import nixpkgs {
	  system = "x86_64-linux";
	  config.allowUnfree = true;
          permittedInsecurePackages = [ "nix-2.16.2" ];
	};
        modules = [ ./hosts/loom/home.nix nixvim.homeManagerModules.nixvim ]; 
      };
      "ewan@endurance" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${"aarch64-darwin"};
        modules = [ ./hosts/endurance/home.nix nixvim.homeManagerModules.nixvim mac-app-util.homeMamangerModules.default ];
      };
    };
  };

}
