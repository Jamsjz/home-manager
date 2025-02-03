{ ... }:
{

  imports = [
    ./keybindings.nix
  ];

  wayland.windowManager.hyprland = {

    enable = true;

    settings = {
      exec-once = [
        # See https://wiki.hyprland.org/Configuring/Keywords/
        "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        "dbus-update-activation-environment --systemd --all"
        "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        "waybar"
        "blueman-applet"
        "udiskie --no-automount --smart-tray"
        "nm-applet --indicator"
        # "dunst"
        "wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"
        "swww-daemon --format xrgb && swww restore"
        #$scrPath/batterynotify.sh # battery notification"
      ];

      input = {

        kb_layout = "us";
        follow_mouse = 1;

        touchpad = {
          natural_scroll = false;
          tap-to-click = true;
        };

        focus_on_close = 0;
        sensitivity = 0;
        force_no_accel = true;
        kb_options = "caps:swapescape";
        repeat_rate = 50;
        repeat_delay = 300;
      };

      dwindle = {
        pseudotile = "yes";
        preserve_split = "yes";
        use_active_for_splits = true;
        force_split = 0;
        special_scale_factor = 1.0;
        split_width_multiplier = 1.0;
      };

      general = {

        gaps_in = 0;
        gaps_out = 0;
        border_size = 0;
        "col.active_border" = "rgba(bb9af7ff) rgba(b4f9f8ff) 45deg";
        "col.inactive_border" = "rgba(565f89cc) rgba(9aa5cecc) 45deg";
        resize_on_border = true;

        layout = "dwindle";
        "$mainMod" = "SUPER";
        "$term" = "kitty";
        "$editor" = "neovide";
        "$editor_config" = "neovide ~/.config/nvim/";
        "$file" = "thunar";
        "$file_terminal" = "kitty yazi";
        "$browser" = "zen";
        "$t_sec" = "ghostty";
        "$pdf_reader" = "zathura";
        "$scrPath" = "~/.local/share/bin";
      };

      group = {


        "col.border_active" = "rgba(bb9af7ff) rgba(b4f9f8ff) 45deg";
        "col.border_inactive" = "rgba(565f89cc) rgba(9aa5cecc) 45deg";
        "col.border_locked_active" = "rgba(bb9af7ff) rgba(b4f9f8ff) 45deg";
        "col.border_locked_inactive" = "rgba(565f89cc) rgba(9aa5cecc) 45deg";


      };


      misc = {
        vrr = 0;
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
        force_default_wallpaper = 0;
        animate_manual_resizes = true;
        animate_mouse_windowdragging = true;
        layers_hog_keyboard_focus = true;
        enable_swallow = true;
        focus_on_activate = true;
      };


      decoration = {
        active_opacity = 1.0;
        inactive_opacity = 0.5;
        rounding = 8;


        blur = {
          enabled = true;
          size = 3;
          passes = 2;
          brightness = 1;
          contrast = 1.4;
          ignore_opacity = true;
          noise = 0;
          new_optimizations = true;
          xray = true;
        };

        #     blur {
        #         enabled = yes
        # #size = 0
        # #passes = 0
        #         size = 2
        #         passes = 3
        #         new_optimizations = on
        #         ignore_opacity = on
        #         xray = false
        #     }

      };


      animations = {
        enabled = true;


        bezier = [
          "linear, 0, 0, 1, 1"
          "md3_standard, 0.2, 0, 0, 1"
          "md3_decel, 0.05, 0.7, 0.1, 1"
          "md3_accel, 0.3, 0, 0.8, 0.15"
          "overshot, 0.05, 0.9, 0.1, 1.1"
          "crazyshot, 0.1, 1.5, 0.76, 0.92 "
          "hyprnostretch, 0.05, 0.9, 0.1, 1.0"
          "menu_decel, 0.1, 1, 0, 1"
          "menu_accel, 0.38, 0.04, 1, 0.07"
          "easeInOutCirc, 0.85, 0, 0.15, 1"
          "easeOutCirc, 0, 0.55, 0.45, 1"
          "easeOutExpo, 0.16, 1, 0.3, 1"
          "softAcDecel, 0.26, 0.26, 0.15, 1"
          "md2, 0.4, 0, 0.2, 1" # use with .2s duration
        ];

        animation = [
          "windows, 1, 3, md3_decel, popin 60%"
          "windowsIn, 1, 3, md3_decel, popin 60%"
          "windowsOut, 1, 3, md3_accel, popin 60%"
          "border, 1, 10, default"
          "fade, 1, 3, md3_decel"
          #"layers, 1, 2, md3_decel, slide"
          "layersIn, 1, 3, menu_decel, slide"
          "layersOut, 1, 1.6, menu_accel"
          "fadeLayersIn, 1, 2, menu_decel"
          "fadeLayersOut, 1, 4.5, menu_accel"
          "workspaces, 1, 7, menu_decel, slidevert"
          #"workspaces, 1, 2.5, softAcDecel, slide"
          #"workspaces, 1, 7, menu_decel, slidefade 15%"
          #"specialWorkspace, 1, 3, md3_decel, slidefadevert 15%"
          "specialWorkspace, 1, 3, md3_decel, slidevert"
        ];
      };

      device = {
        name = "dell0c3c:01-06cb:ce26-touchpad";
        enabled = true;
      };

      gestures = {
        workspace_swipe = true;
        workspace_swipe_fingers = 3;
      };

      cursor = {
        inactive_timeout = ".009";
        hide_on_key_press = true;
      };

      windowrulev2 = [
        "opacity 0.89 0.80,class:^(firefox)$"
        "opacity 0.80 0.80,class:^(zen-beta)$"
        "opacity 0.90 0.90,class:^(obsidian)$"
        "opacity 0.90 0.90,class:^(librewolf)$"
        "opacity 0.90 0.90,class:^(Brave-browser)$"
        "opacity 0.85 0.85,class:^(code-oss)$"
        "opacity 0.80 0.80,class:^(Code)$"
        "opacity 0.75 0.75,class:^(org.pwmt.zathura)$"
        "opacity 0.9 0.9,class:^(code-url-handler)$"
        "opacity 0.80 0.80,class:^(code-insiders-url-handler)$"
        "opacity 0.90 0.90 ,class:^(kitty)$"
        "opacity 0.80 0.80 ,class:^(com.mitchellh.ghostty)$"
        "opacity 0.70 0.70,class:^(st)$"
        "opacity 0.80 0.80,class:^(qt5ct)$"
        "opacity 0.80 0.80,class:^(qt6ct)$"
        "opacity 0.80 0.70,class:^(org.pulseaudio.pavucontrol)$"
        "opacity 0.80 0.70,class:^(blueman-manager)$"
        "opacity 0.80 0.70,class:^(nm-applet)$"
        "opacity 0.80 0.70,class:^(nm-connection-editor)$"
        "opacity 0.80 0.70,class:^(org.kde.polkit-kde-authentication-agent-1)$"
        "opacity 0.80 0.70,class:^(polkit-gnome-authentication-agent-1)$"
        "opacity 0.80 0.70,class:^(org.freedesktop.impl.portal.desktop.gtk)$"
        "opacity 0.80 0.70,class:^(org.freedesktop.impl.portal.desktop.hyprland)$"
        "opacity 0.70 0.70,class:^([Ss]team)$"
        "opacity 0.70 0.70,class:^(steamwebhelper)$"
        "opacity 0.90 0.90,class:^(Spotify)$"
        "opacity 0.8 0.80,initialTitle:^(Spotify Free)$"
        "opacity 0.90 0.90,class:^(com.github.rafostar.Clapper)$"
        "opacity 0.80 0.80,class:^(com.github.tchx84.Flatseal)$"
        "opacity 0.80 0.80,class:^(hu.kramo.Cartridges)$"
        "opacity 0.80 0.80,class:^(com.obsproject.Studio)$"
        "opacity 0.80 0.80,class:^(gnome-boxes)$"
        "opacity 0.80 0.80,class:^(discord)$"
        "float,title:^(About Mozilla Firefox)$"
        "float,class:^(firefox)$,title:^(Picture-in-Picture)$"
        "float,class:^(firefox)$,title:^(Library)$"
        "float,class:^(librewolf)$,title:^(Picture-in-Picture)$"
        "float,class:^(librewolf)$,title:^(Library)$"
        "float,class:^(kitty)$,title:^(btop)$"
        "float,class:^(kitty)$,title:^(htop)$"
        "float,class:^(kvantummanager)$"
        "float,class:^(qt5ct)$"
        "float,class:^(qt6ct)$"
        "float,class:^(nwg-look)$"
        "float,class:^(org.kde.ark)$"
        "float,class:^(org.pulseaudio.pavucontrol)$"
        "float,class:^(blueman-manager)$"
        "float,class:^(nm-applet)$"
        "float,class:^(nm-connection-editor)$"
        "float,class:^(org.kde.polkit-kde-authentication-agent-1)$"
        "float,class:^(Signal)$"
        "float,class:^(com.github.rafostar.Clapper)$"
        "float,class:^(app.drey.Warp)$"
        "float,class:^(net.davidotek.pupgui2)$"
        "float,class:^(yad)$"
        "float,class:^(eog)$"
        "float,class:^(io.github.alainm23.planify)$"
        "float,class:^(io.gitlab.theevilskeleton.Upscaler)$"
        "float,class:^(com.github.unrud.VideoDownloader)$"
        "float,class:^(io.gitlab.adhami3310.Impression)$"
        "float,class:^(io.missioncenter.MissionCenter)$"
        "float,class:^(io.github.flattool.Warehouse)$"
        "float,class:^(org.kde.dolphin)$,title:^(Progress Dialog — Dolphin)$"
        "float,class:^(org.kde.dolphin)$,title:^(Copying — Dolphin)$"
        "float,title:^(About Mozilla librewolf)$"
        "float,class:^(firefox)$,title:^(Picture-in-Picture)$"
        "float,class:^(firefox)$,title:^(Library)$"
        "float,title:^(About Mozilla librewolf)$"
        "float,class:^(librewolf)$,title:^(Picture-in-Picture)$"
        "float,class:^(librewolf)$,title:^(Library)$"
        "float,class:^(kitty)$,title:^(btop)$"
        "float,class:^(kitty)$,title:^(htop)$"
        "float,class:^(kvantummanager)$"
        "float,class:^(qt5ct)$"
        "float,class:^(qt6ct)$"
        "float,class:^(nwg-look)$"
        "float,class:^(org.kde.ark)$"
        "float,class:^(org.pulseaudio.pavucontrol)$"
        "float,class:^(blueman-manager)$"
        "float,class:^(nm-applet)$"
        "float,class:^(nm-connection-editor)$"
        "float,class:^(org.kde.polkit-kde-authentication-agent-1)$"
        "float,class:^(Signal)$"
        "float,class:^(com.github.rafostar.Clapper)$"
        "float,class:^(app.drey.Warp)$"
        "float,class:^(net.davidotek.pupgui2)$"
        "float,class:^(yad)$"
        "float,class:^(eog)$"
        "float,class:^(io.github.alainm23.planify)$"
        "float,class:^(io.gitlab.theevilskeleton.Upscaler)$"
        "float,class:^(com.github.unrud.VideoDownloader)$"
        "float,class:^(io.gitlab.adhami3310.Impression)$"
        "float,class:^(io.missioncenter.MissionCenter)$"
        "nofocus,class:REAPER,title:^$"
        "move cursor,class:REAPER,floating:1"
      ];






    };

    extraConfig = ''
exec-once = [workspace 10 silent] kitty
exec-once = [workspace 9 silent] spicetify-nix
exec-once = [workspace 9 silent] zen-beta
exec-once = [workspace 8 silent] obsidian
exec-once = [workspace 5 silent] nautilus
exec-once = [workspace 4 silent] steam
exec-once = [workspace 3 silent] reaper
exec-once = [workspace special silent] spotify

        monitor = ,preferred,auto,1
#monitor = ,preferred,auto,1, transform, 3  #rotate 90degree
#monitor = ,preferred,auto,1, transform, 1  #rotate 270degree
      xwayland {
        force_zero_scaling = false
      }


env = PATH,$PATH:$HOME/.local/share/bin
env = XDG_SESSION_TYPE,wayland
env = XDG_CURRENT_DESKTOP,Hyprland
env = XDG_SESSION_DESKTOP,Hyprland
env = QT_QPA_PLATFORM,wayland
env = QT_QPA_PLATFORMTHEME,qt6ct
env = QT_WAYLAND_DISABLE_WINDOWDECORATION,1
env = QT_AUTO_SCREEN_SCALE_FACTOR,1
env = MOZ_ENABLE_WAYLAND,1
env = GDK_SCALE,1
#env = MANPAGER,'nvim +Man!'
env = MOUSE,"0"



layerrule = blur,rofi
layerrule = blur,waybar
layerrule = blur,kitty
layerrule = ignorezero,rofi
layerrule = blur,notifications
layerrule = ignorezero,notifications
layerrule = blur,swaync-notification-window
layerrule = ignorezero,swaync-notification-window
layerrule = blur,swaync-control-center
layerrule = ignorezero,swaync-control-center
layerrule = blur,logout_dialog
      '';

  };



}
