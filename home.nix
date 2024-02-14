home-manager.users.shade = { pkgs, ... }: {
  home.username = "shade";
  home.homeDirectory = "/home/shade";
  programs.home-manager.enable = true;
  home.packages = with pkgs; [
    # your desired nixpkgs here
  ];
  home.stateVersion = "23.11";
};
