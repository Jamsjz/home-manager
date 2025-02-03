{
  description = "Home Manager configuration of viola";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    spicetify-nix.inputs.nixpkgs.follows = "nixpkgs";
    hyprland.url = "github:hyprwm/Hyprland";
    ghostty.url = "github:ghostty-org/ghostty";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, zen-browser, hyprland, ghostty, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; config.allowUnfree = true; };
    in
    {
      homeConfigurations."viola" = home-manager.lib.homeManagerConfiguration {
        pkgs = pkgs; # Pass the pkgs argument explicitly
        modules = [
          ./home.nix
        ];
        extraSpecialArgs = {
          inherit inputs system zen-browser hyprland ghostty;
        };
      };
    };
}
