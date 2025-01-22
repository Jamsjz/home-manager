{ pkgs
, lib
, inputs 
, ...
}:
let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
in
{
  nixpkgs.config.allowUnfreePredicate =
    pkg: builtins.elem (lib.getName pkg) [ "spotify" ];

  imports = [ inputs.spicetify-nix.homeManagerModules.default ];

programs.spicetify =
let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
in
{
  enable = true;

  enabledExtensions = with spicePkgs.extensions; [
    adblock
    hidePodcasts
    shuffle # shuffle+ (special characters are sanitized out of extension names)
    fullAppDisplay
    keyboardShortcut
    popupLyrics
    history
    beautifulLyrics
  ];
  enabledCustomApps = with spicePkgs.apps; [
    newReleases
    ncsVisualizer
  ];
  enabledSnippets = with spicePkgs.snippets; [
    #rotating-coverart
    pointer
  ];

  # theme = spicePkgs.themes.ziro;
  # colorScheme = "purple-dark";

   # theme = spicePkgs.themes.dribbblish;
   # #colorScheme = "gruvbox";
   # colorScheme = "purple";

   # theme = spicePkgs.themes.starryNight;
   # colorScheme = "forest";

    theme = spicePkgs.themes.sleek;
    colorScheme = "wealthy";
  };
}
