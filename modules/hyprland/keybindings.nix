{ ... }: {

  wayland.windowManager.hyprland.settings = {

    bind = [
      "$mainMod, Q, exec, hyprctl dispatch killactive ''"
      "$mainMod, Delete, exit"
      "$mainMod, W, togglefloating"
      "$mainMod, G, togglegroup"
      "$mainMod, F, fullscreen"
      "$mainMod+Shift, X, exec, hyprlock"
      "$mainMod+Shift, C, exec, hyprpicker"
      "Ctrl, Escape, exec, pkill waybar || waybar"
      "$mainMod, T, exec, $scrPath/touchpad.sh"
      "$mainMod+Shift, T, exec, $scrPath/animation.sh"
      "$mainMod, RETURN, exec, $term"
      "$mainMod+Alt , T ,exec, $t_sec"
      "$mainMod, E, exec, $file"
      "$mainMod, n ,  exec, $editor"
      "$mainMod, c ,  exec, $editor_config"
      "$mainMod+Shift, RETURN, exec, $emacs"
      "$mainMod, B, exec, $browser"
      "Ctrl+Shift, Escape, exec, pkill -x btop || kitty btop"
      "$mainMod, Y, exec, $file_terminal"
      "$mainMod+Shift,z, exec, $pdf_reader"
      "$mainMod, Backspace, exec, $scrPath/logoutlaunch.sh"
      "$mainMod, D ,exec ,$scrPath/rofilaunch.sh"
      "$mainMod, Tab, exec, $scrPath/rofilaunch.sh w"
      "$mainMod+Shift, E, exec, conda-shell -c 'zsh -c code'"
      "$mainMod, P, exec, playerctl play-pause --player spotify"
      ", Print, exec, $scrPath/screenshot.sh p"
      "$mainMod+Shift, P, exec, $scrPath/screenshot.sh sf"
      "$mainMod+Alt, G, exec, $scrPath/gamemode.sh"
      "$mainMod+Alt, Right, exec, $scrPath/swwwallpaper.sh -n"
      "$mainMod+Alt, Left, exec, $scrPath/swwwallpaper.sh -p"
      "$mainMod+Shift, R, exec, pkill -x rofi || $scrPath/wallbashtoggle.sh -m"
      #"$mainMod+Shift, T, exec, pkill -x rofi || $scrPath/themeselect.sh"
      "$mainMod+Shift, A, exec, pkill -x rofi || $scrPath/rofiselect.sh"
      "$mainMod+Shift, W, exec,waypaper"
      "$mainMod, V, exec, pkill -x rofi || $scrPath/cliphist.sh c"
      "$mainMod, J, movefocus, d"
      "$mainMod, K, movefocus, u"
      "$mainMod, L, movefocus, r"
      "$mainMod, H, movefocus, l"
      "$mainMod, 1, workspace, 1"
      "$mainMod, 2, workspace, 2"
      "$mainMod, 3, workspace, 3"
      "$mainMod, 4, workspace, 4"
      "$mainMod, 5, workspace, 5"
      "$mainMod, 6, workspace, 6"
      "$mainMod, 7, workspace, 7"
      "$mainMod, 8, workspace, 8"
      "$mainMod, 9, workspace, 9"
      "$mainMod, 0, workspace, 10"
      "$mainMod, Minus, workspace, 11"
      "$mainMod, Equal, workspace, 12"
      "$mainMod, period, workspace, r+1"
      "$mainMod, comma, workspace, r-1"
      "$mainMod, Down, workspace, empty"
      "$mainMod+Ctrl, 1, movetoworkspace, 1"
      "$mainMod+Ctrl, 2, movetoworkspace, 2"
      "$mainMod+Ctrl, 3, movetoworkspace, 3"
      "$mainMod+Ctrl, 4, movetoworkspace, 4"
      "$mainMod+Ctrl, 5, movetoworkspace, 5"
      "$mainMod+Ctrl, 6, movetoworkspace, 6"
      "$mainMod+Ctrl, 7, movetoworkspace, 7"
      "$mainMod+Ctrl, 8, movetoworkspace, 8"
      "$mainMod+Ctrl, 9, movetoworkspace, 9"
      "$mainMod+Ctrl, 0, movetoworkspace, 10"
      "$mainMod+Ctrl, period, movetoworkspace, r+1"
      "$mainMod+Ctrl, comma, movetoworkspace, r-1"
      "$mainMod+Shift+Ctrl, H, movewindow, l"
      "$mainMod+Shift+Ctrl, L, movewindow, r"
      "$mainMod+Shift+Ctrl, K, movewindow, u"
      "$mainMod+Shift+Ctrl, J, movewindow, d"
      "$mainMod, mouse_down, workspace, e-1"
      "$mainMod, mouse_up, workspace, e+1"
      "$mainMod+Shift, S, movetoworkspacesilent, special"
      "$mainMod, S, togglespecialworkspace"
      "$mainMod+Shift, O, togglesplit"
      "$mainMod+Shift, 1, movetoworkspacesilent, 1"
      "$mainMod+Shift, 2, movetoworkspacesilent, 2"
      "$mainMod+Shift, 3, movetoworkspacesilent, 3"
      "$mainMod+Shift, 4, movetoworkspacesilent, 4"
      "$mainMod+Shift, 5, movetoworkspacesilent, 5"
      "$mainMod+Shift, 6, movetoworkspacesilent, 6"
      "$mainMod+Shift, 7, movetoworkspacesilent, 7"
      "$mainMod+Shift, 8, movetoworkspacesilent, 8"
      "$mainMod+Shift, 9, movetoworkspacesilent, 9"
      "$mainMod+Shift, 0, movetoworkspacesilent, 10"
    ];

    bindm = [

      "$mainMod, mouse:272, movewindow"
      "$mainMod, mouse:273, resizewindow"
      "$mainMod, Z, movewindow"
      "$mainMod, X, resizewindow"
    ];

    bindl = [

      ", F10, exec, $scrPath/volumecontrol.sh -o m"
      ", XF86AudioMute, exec, $scrPath/volumecontrol.sh -o m"
      ", XF86AudioMicMute, exec, $scrPath/volumecontrol.sh -i m"
      "$mainMod, XF86AudioPlay, exec, playerctl play-pause"
      "$mainMod, XF86AudioPause, exec, playerctl play-pause"
      "$mainMod, XF86AudioNext, exec, playerctl next"
      "$mainMod, XF86AudioPrev, exec, playerctl previous"
",switch:Lid Switch,exec,hyprlock"
    ];

    bindel = [
      ", F11, exec, $scrPath/volumecontrol.sh -o d"
      ", F12, exec, $scrPath/volumecontrol.sh -o i"
      ", XF86AudioLowerVolume, exec, $scrPath/volumecontrol.sh -o d"
      ", XF86AudioRaiseVolume, exec, $scrPath/volumecontrol.sh -o i"
      ", XF86MonBrightnessUp, exec, $scrPath/brightnesscontrol.sh i"
      ", XF86MonBrightnessDown, exec, $scrPath/brightnesscontrol.sh d"
    ];
    binde = [
    
      "$mainMod+Shift, L, resizeactive, 30 0"
      "$mainMod+Shift, H, resizeactive, -30 0"
      "$mainMod+Shift, K, resizeactive, 0 -30"
      "$mainMod+Shift, J, resizeactive, 0 30"
    ];

  };
}
