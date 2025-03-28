{ pkgs, system, inputs,... }:

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
  ];
  home.stateVersion = "24.11";
  home.packages = with pkgs;[
    inputs.zen-browser.packages."${system}".default
    inputs.ghostty.packages.x86_64-linux.default
    maple-mono
    maple-mono-NF
    gruvbox-kvantum
    neovide
    # audio plugins
    gxplugins-lv2
    helm
    dragonfly-reverb
    aether-lv2
    neural-amp-modeler-lv2
    proteus
    hybridreverb2
    mooSpace
    kaggle
    fverb
    guitarix
    lsp-plugins
    x42-plugins
    x42-gmsynth
    x42-avldrums
    chow-tape-model
    airwindows-lv2
    chow-kick
    chow-centaur
    chow-phaser
    picoloop
    sorcer
    qjackctl
    carla
    oxefmsynth
    ninjas2
    zam-plugins
    surge-XT
  ];

  home.file = { };

  programs.neovim = {
    defaultEditor = true;
    extraLuaPackages = ps: [ ps.magick ];
    extraPackages = [ pkgs.imagemagick ];
    enable = true;
  };

  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = ["qemu:///system"];
      uris = ["qemu:///system"];
    };
  };

  fonts.fontconfig.enable = true;
}
