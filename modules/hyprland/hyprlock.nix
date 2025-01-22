{ pkgs, ... }: {

  programs.hyprlock = {
    enable = true;
    package = pkgs.hyprlock;
    settings = {

      general = {
        grace = 1;
        hide_cursor = true;
        no_fade_in = false;
        ignore_empty_input = true;
      };

      background = {
        path = "/home/viola/.config/hyde/themes/Catppuccin Mocha/wallpapers/b-013.jpg";

        blur_passes = 0.9;
        noise = 0.0117;
        contrast = 0;
        brightness = 0.8000;
        vibrancy = 0.2100;
        vibrancy_darkness = 0.0;
      };



      input-field = {
        monitor = "";
        size = "0, 0";
        outline_thickness = 1;
        dots_size = 0.33;
        dots_spacing = 0.15;
        dots_center = true;
        fade_on_empty = true;
        placeholder_text = "<i></i>";
        hide_input = true;
        position = "0, 200";
        halign = "center";
        valign = "bottom";
        fade_timeout = 1;
      };
    };

    extraConfig = ''

label {
    monitor =
    text = cmd[update:18000000] echo "<b> "$(date +'%A, %-d %B %Y')" </b>"
   # color = $color12
    font_size = 34
    font_family = JetBrains Mono Nerd Font Mono ExtraBold
    position = 0, -100
    halign = center
    valign = top
}

# Hour-Time
label {
    monitor =
    text = cmd[update:1000] echo "$(date +"%I")" #AM/PM
    color = rgba(255, 185, 0, .6)
    font_size = 200
    font_family = JetBrains Mono Nerd Font Mono ExtraBold 
    position = 0, -200
    halign = center
    valign = top
}

# Minute-Time
label {
    monitor =
    text = cmd[update:1000] echo "$(date +"%M")"
    color = rgba(255, 255, 255, .6)
    font_size = 200
    font_family = JetBrains Mono Nerd Font Mono ExtraBold
    position = 0, -500
    halign = center
    valign = top
}

# Seconds-Time
label {
    monitor =
    text = cmd[update:1000] echo "$(date +"%S")"
#    text = cmd[update:1000] echo "$(date +"%S %p")" #AM/PM
    #color = $color12
    font_size = 40
    font_family = JetBrains Mono Nerd Font Mono ExtraBold
    position = 200, -690
    halign = center
    valign = top
}

# User
label {
    monitor =
    text = $USER
    #color = $color12
    font_size = 18
    font_family = CaskaydiaCove Nerd Font Mono
    position = 0, 100
    halign = center
    valign = bottom
}

# uptime
label {
    monitor =
    text = cmd[update:60000] echo "<b> "$(uptime -p)" </b>"
    #color = $color12
    font_size = 18
    font_family = JetBrains Mono Nerd Font Mono ExtraBold
    position = 0, 0
    halign = right
    valign = bottom
}

'';

  };
}
