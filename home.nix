{ config, pkgs, system, inputs, ... }:

{
  home.username = "viola";
  home.homeDirectory = "/home/viola";
  imports = [
    ./modules/spicetify.nix
    ./modules/zsh.nix
    ./modules/themes/gtk.nix
    ./modules/browser.nix
    ./modules/fonts.nix
    ./modules/waybar.nix
    ./modules/kitty.nix
    ./modules/dunst.nix
    ./modules/btop.nix
    ./modules/fastfetch.nix
    ./modules/tmux.nix
    ./modules/hyprland/default.nix
    ./modules/rofi.nix
    #./modules/ghostty.nix
    #./modules/thunderbird.nix
  ];
  home.stateVersion = "24.11";
  home.packages = with pkgs;[
    inputs.zen-browser.packages."${system}".default
inputs.ghostty.packages.x86_64-linux.default

    maple-mono
    maple-mono-NF
    gruvbox-kvantum
  ];

  home.file = { };

  programs.neovim = {
    defaultEditor = true;
    enable = true;
  };


  # programs.git = {
  #   enable = true;
  #   userName = "Jamsjz";
  #   userEmail = "gj984233@gmail.com";
  #   extraConfig = {
  #     init.defaultBranch = "main";
  #   };
  # };

  fonts.fontconfig.enable = true;

}
