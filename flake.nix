{
  description = "ewanhardingham's Nix Flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
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
  };

  outputs = { self, nixpkgs, home-manager, nixvim, nix-darwin, ... }:
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
      "tars" = nix-darwin.lib.darwinSystem {
        modules = [ ./hosts/tars/configuration.nix ];
      };
      "bamber" = nix-darwin.lib.darwinSystem {
        modules = [ ./hosts/bamber/configuration.nix ];
      };
    };
    darwinPackages = self.darwinConfigurations."tars".pkgs;
    homeConfigurations = {
      "ewan@loom" = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
          system = "x86_64-linux";
          config.allowUnfree = true;
          permittedInsecurePackages = [ "nix-2.16.2" ];
        };
        modules = [ ./hosts/loom/home.nix nixvim.homeManagerModules.nixvim ]; 
      };
      "ewan.hardingham@tars" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${"aarch64-darwin"};
        modules = [ ./hosts/tars/home.nix nixvim.homeManagerModules.nixvim ];
      };
      "ewan@bamber" = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
	  system = "aarch64-darwin";
	  config.allowUnfree = true;
	};
        modules = [ ./hosts/bamber/home.nix nixvim.homeManagerModules.nixvim ];
      };
    };
  };
}
