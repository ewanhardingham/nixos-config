{
  description = "ewanhardingham's Nix Flake";

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
    nix-wsl = {
      url = "github:nix-community/NixOS-WSL";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, nixvim, nix-darwin, nix-wsl, ... }:
    let
      lib = nixpkgs.lib;
    in {
    nixosConfigurations = {
      loom = lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ ./hosts/loom/configuration.nix ];
      };
      loom-win = lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          { nix.registry.nixpkgs.flake = nixpkgs; }
          ./hosts/loom-win/configuration.nix
          nix-wsl.nixosModules.wsl
        ];
      };
    };
    darwinConfigurations = {
      "tars" = nix-darwin.lib.darwinSystem {
        modules = [ ./hosts/tars/configuration.nix ];
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
      "ewan@loom-win" = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
          system = "x86_64-linux";
          config.allowUnfree = true;
          permittedInsecurePackages = [ "nix-2.16.2" ];
        };
        modules = [ ./hosts/loom-win/home.nix nixvim.homeManagerModules.nixvim ]; 
      };
      "ewan.hardingham@tars" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${"aarch64-darwin"};
        modules = [ ./hosts/tars/home.nix nixvim.homeManagerModules.nixvim ];
      };
    };
  };

}
