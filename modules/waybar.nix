{ config, lib, pkgs, ... }:
{

  programs.waybar.enable = true;
  programs.waybar.package = pkgs.waybar;

  home.file = {
    ".config/waybar/config.jsonc".text = ''

{

    "layer": "top",
    "position": "bottom",
    "mod": "float",
    "height": 28,
    "exclusive": true,
    "passthrough": false,
    "gtk-layer-shell": true,
    "reload_style_on_change": true,


// positions generated based on config.ctl //

	"modules-left": ["custom/l_end","cpu","memory","custom/cpuinfo","custom/gpuinfo","custom/r_end","custom/l_end","clock","custom/r_end","custom/l_end","hyprland/workspaces","custom/r_end"],
	"modules-center": ["custom/padd","custom/l_end","hyprland/window","custom/r_end"],
	"modules-right": ["custom/l_end","backlight","network","pulseaudio","custom/r_end","custom/l_end","tray","battery","custom/r_end"],


// sourced from modules based on config.ctl //

    "cpu": {
        "interval": 10,
        "format": "󰍛 {usage}%",
        "rotate": 0,
        "format-alt": "{icon0}{icon1}{icon2}{icon3}",
        "format-icons": ["▁", "▂", "▃", "▄", "▅", "▆", "▇", "█"]
    },

    "memory": {
        "states": {
            "c": 90, 
            "h": 60, 
            "m": 30, 
        },
        "interval": 30,
        "format": "󰾆 {used}GB",
        "rotate": 0,
        "format-m": "󰾅 {used}GB",
        "format-h": "󰓅 {used}GB",
        "format-c": " {used}GB",
        "format-alt": "󰾆 {percentage}%",
        "max-length": 10,
        "tooltip": true,
        "tooltip-format": "󰾆 {percentage}%\n {used:0.1f}GB/{total:0.1f}GB"
    },

     "idle_inhibitor": {
         "format": "{icon}",
         "rotate": 0,
         "format-icons": {
             "activated": "󰥔 ",
             "deactivated": " "
         }
     },

    "clock": {
        "format": "{:%I:%M %p}",
        "rotate": 0,
        "format-alt": "{:%R 󰃭 %d·%m·%y}",
        "tooltip-format": "<tt>{calendar}</tt>",
        "calendar": {
            "mode": "month",
            "mode-mon-col": 3,
            "on-scroll": 1,
            "on-click-right": "mode",
            "format": {
                "months": "<span color='#ffead3'><b>{}</b></span>",
                "weekdays": "<span color='#ffcc66'><b>{}</b></span>",
                "today": "<span color='#ff6699'><b>{}</b></span>"
            }
        },
        "actions": {
            "on-click-right": "mode",
            "on-click-forward": "tz_up",
            "on-click-backward": "tz_down",
            "on-scroll-up": "shift_up",
            "on-scroll-down": "shift_down"
        }
    },


    "hyprland/workspaces": {
        "disable-scroll": true,
        "rotate": 0,
        "all-outputs": true,
        "active-only": false,
        "on-click": "activate",
        "disable-scroll": false,
        "on-scroll-up": "hyprctl dispatch workspace -1",
        "on-scroll-down": "hyprctl dispatch workspace +1",
        "persistent-workspaces": {
        }
    },


    // "hyprland/window": {
    //     "format": " ❄ {}",
    //     "rotate": 0,
    //     "separate-outputs": true,
    //     "rewrite": {
    //         "viola@viole:(.*)": "$1 ",
    //         "(.*) — Mozilla Firefox": "$1 󰈹",
    //         "(.*)Mozilla Firefox": "Firefox 󰈹",
    //         "(.*) - Visual Studio Code": "$1 󰨞",
    //         "(.*)Visual Studio Code": "Code 󰨞",
    //         "(.*) — Dolphin": "$1 󰉋",
    //         "(.*)Spotify": "Spotify 󰓇",
    //         "(.*)Steam": "Steam 󰓓"
    //     },
    //     "max-length": 1000
    // },
  "hyprland/window": {
        "format": " ❄  {}",
        "rotate": 0,
        "separate-outputs": true,
        "rewrite": {
            "(.*) — Mozilla Firefox": "$1 󰈹",
            "(.*)Mozilla Firefox": "$1 Firefox 󰈹",
            "(.*) - Visual Studio Code": "$1 󰨞",
            "(.*)Visual Studio Code": "$1 Code 󰨞",
            "(.*) — Dolphin": "$1 󰉋",
            "(.*)Spotify.*": "$1 Spotify 󰓇",
            "(.*)Steam": "$1 Steam 󰓓",
            "(.*) - Discord": "$1  ",
            "(.*?)-\\s*YouTube(.*)": "$1󰗃", 
            "(.*?\\s)YouTube(.*)": "$1YouTube 󰗃"
        },
        "max-length":1000
    },

    "backlight": {
        "device": "intel_backlight",
        "rotate": 0,
        "format": "{icon} {percent}%",
        "format-icons": ["", "", "", "", "", "", "", "", ""],
        "on-scroll-up": "brightnessctl set 5%+",
        "on-scroll-down": "brightnessctl set 5%-",
        "min-length": 6
    },

    "pulseaudio": {
        "format": "{icon} {volume}",
        "rotate": 0,
        "format-muted": "婢",
        "on-click": "pavucontrol -t 3",
        "on-click-middle": "volumecontrol.sh -o m",
        "on-scroll-up": "volumecontrol.sh -o i",
        "on-scroll-down": "volumecontrol.sh -o d",
        "tooltip-format": "{icon} {desc} // {volume}%",
        "scroll-step": 5,
        "format-icons": {
            "headphone": "",
            "hands-free": "",
            "headset": "",
            "phone": "",
            "portable": "",
            "car": "",
            "default": ["", "", ""]
        }
    },

    "tray": {
        "icon-size": 16,
        "rotate": 0,
        "spacing": 5,
"show-passive-items": false

    },

    "custom/tray_update":{
      "icon-size":12,
      "rotate":0,
      "spacing":4
    },

    "battery": {
        "states": {
            "good": 95,
            "warning": 30,
            "critical": 20
        },
        "format": "{icon}{capacity}%",
        "rotate": 0,
        "format-charging": "{capacity}%",
        "format-plugged": "{capacity}%",
        "format-alt": "{time}{icon}",
        "format-icons": ["󰂎", "󰁺", "󰁻", "󰁼", "󰁽", "󰁾", "󰁿", "󰂀", "󰂁", "󰂂", "󰁹"]
    },
// modules for padding //

    "custom/l_end": {
        "format": " ",
        "interval" : "once",
        "tooltip": false
    },

    "custom/r_end": {
        "format": " ",
        "interval" : "once",
        "tooltip": false
    },

    "custom/sl_end": {
        "format": " ",
        "interval" : "once",
        "tooltip": false
    },

    "custom/sr_end": {
        "format": " ",
        "interval" : "once",
        "tooltip": false
    },

    "custom/rl_end": {
        "format": " ",
        "interval" : "once",
        "tooltip": false
    },

    "custom/rr_end": {
        "format": " ",
        "interval" : "once",
        "tooltip": false
    },

    "custom/padd": {
        "format": "  ",
        "interval" : "once",
        "tooltip": false
    }

}
    '';

  };
  programs.waybar.style =
    ''
* {
  border: none;
  border-radius: 0px;
  font-family: "JetBrainsMono Nerd Font";
  font-weight: bold;
  font-size: 15px;
  min-height: 10px;
}

@define-color bar-bg rgba(18,21,22,0);
@define-color main-bg rgba(18,21,22,0.8);
@define-color main-fg rgba(170,222,240,0.8);
@define-color wb-act-bg rgba(152,123,105,0.4);
@define-color wb-act-fg rgba(255,224,204,1);
@define-color wb-hvr-bg rgba(75,117,125,0.4);
@define-color wb-hvr-fg rgba(240,205,170,0.8);

window#waybar {
  background: @bar-bg;
}

tooltip {
  background: @main-bg;
  color: @main-fg;
  border-radius: 7px;
  border-width: 0px;
}

#workspaces button {
  box-shadow: none;
  text-shadow: none;
  padding: 0px;
  border-radius: 8px;
  margin-top: 2px;
  margin-bottom: 2px;
  margin-left: 0px;
  padding-left: 2px;
  padding-right: 2px;
  margin-right: 0px;
  color: @main-fg;
  animation: ws_normal 20s ease-in-out 1;
}

#workspaces button.active {
  background: @wb-act-bg;
  color: @wb-act-fg;
  margin-left: 2px;
  padding-left: 11px;
  padding-right: 11px;
  margin-right: 2px;
  animation: ws_active 20s ease-in-out 1;
  transition: all 0.4s cubic-bezier(0.55, -0.68, 0.48, 1.682);
}

#workspaces button:hover {
  background: @wb-hvr-bg;
  color: @wb-hvr-fg;
  animation: ws_hover 20s ease-in-out 1;
  transition: all 0.3s cubic-bezier(0.55, -0.68, 0.48, 1.682);
}

#taskbar button {
  box-shadow: none;
  text-shadow: none;
  padding: 0px;
  border-radius: 8px;
  margin-top: 2px;
  margin-bottom: 2px;
  margin-left: 0px;
  padding-left: 2px;
  padding-right: 2px;
  margin-right: 0px;
  color: @wb-color;
  animation: tb_normal 20s ease-in-out 1;
}

#taskbar button.active {
  background: @wb-act-bg;
  color: @wb-act-color;
  margin-left: 2px;
  padding-left: 11px;
  padding-right: 11px;
  margin-right: 2px;
  animation: tb_active 20s ease-in-out 1;
  transition: all 0.4s cubic-bezier(0.55, -0.68, 0.48, 1.682);
}

#taskbar button:hover {
  background: @wb-hvr-bg;
  color: @wb-hvr-color;
  animation: tb_hover 20s ease-in-out 1;
  transition: all 0.3s cubic-bezier(0.55, -0.68, 0.48, 1.682);
}

#tray menu * {
  min-height: 16px;
}

#tray menu separator {
  min-height: 10px;
}

#backlight,
#battery,
#bluetooth,
#custom-cliphist,
#clock,
#cpu,
#custom-cpuinfo,
#custom-gpuinfo,
#idle_inhibitor,
#custom-keybindhint,
#language,
#memory,
#mpris,
#network,
#custom-notifications,
#custom-power,
#pulseaudio,
#custom-spotify,
#taskbar,
#custom-theme,
#tray,
#custom-updates,
#custom-wallchange,
#custom-wbar,
#window,
#workspaces,
#custom-l_end,
#custom-r_end,
#custom-sl_end,
#custom-sr_end,
#custom-rl_end,
#custom-rr_end {
  color: @main-fg;
  background: @main-bg;
  opacity: 1;
  margin: 3px 0px 3px 0px;
  padding-left: 4px;
  padding-right: 13px;
}

#workspaces,
#taskbar {
  padding: 0px;
}

#custom-r_end {
  border-radius: 0px 19px 19px 0px;
  margin-right: 8px;
  padding-right: 0px;
}

#custom-l_end {
  border-radius: 19px 0px 0px 19px;
  margin-left: 8px;
  padding-left: 0px;
}

#custom-sr_end {
  border-radius: 0px;
  margin-right: 8px;
  padding-right: 0px;
}

#custom-sl_end {
  border-radius: 0px;
  margin-left: 8px;
  padding-left: 0px;
}

#custom-rr_end {
  border-radius: 0px 7px 7px 0px;
  margin-right: 8px;
  padding-right: 0px;
}

#custom-rl_end {
  border-radius: 7px 0px 0px 7px;
  margin-left: 8px;
  padding-left: 0px;
}
    '';

}
