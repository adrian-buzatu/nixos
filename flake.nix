{
  description = "flake for shade with Home Manager enabled";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{
    self,
    nixpkgs,
    home-manager,
    ...
  }: {
    nixosConfigurations = {
      rosebud = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.shade = { pkgs, ... }: {
  	      home.username = "shade";
              home.homeDirectory = "/home/shade";
              programs.home-manager.enable = true;
              home.packages = with pkgs; [
                # your desired nixpkgs here
                thunderbird
                keepassxc
                vscode
		vim
                google-chrome
		pkgs.discord
                nodejs
                pkgs.sublime4
                pkgs.deluge-gtk
                pkgs.virtualbox
                pkgs.teamviewer
                pkgs.wine          
              ];
              home.stateVersion = "23.11";
            };

          }
        ];
      };
    };
  };
}
