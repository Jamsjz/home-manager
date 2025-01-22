{ pkgs, ... }: {
  programs.rofi = {
    enable = true;
    font = "JetBrainsMono Nerd Font 10";
    package = pkgs.rofi-wayland;
  };

  home.file = {

    ".config/rofi/theme.rasi".text = ''

* {
    main-bg:            #121516B3;
    main-fg:            #CCF2FFE6;
    main-br:            #4D4741E6;
    main-ex:            #1E292BE6;
    select-bg:          #F0C5AA80;
    select-fg:          #523829E6;
}

'';


".config/rofi/win-config.rasi".text = ''


      @theme "~/.config/rofi/theme.rasi"

      window {
          height:                      12em;
          width:                       38em;
          transparency:                "real";
          fullscreen:                  false;
          enabled:                     true;
          cursor:                      "default";
          spacing:                     0em;
          padding:                     0em;
          border-color:                @main-br;
          background-color:            @main-bg;
      }

'';



    ".config/rofi/launch.rasi".text = ''
      // Config //
      configuration {
          modi:                        "drun,filebrowser,window";
          show-icons:                  true;
          //display-drun:                " ";
          display-drun:                "❄ ";
          display-run:                 " ";
          display-filebrowser:         " ";
          display-window:              " ";
          drun-display-format:         "{name}";
          window-format:               "{w}{t}";
          font:                        "JetBrainsMono Nerd Font 10";
          icon-theme:                  "Tela-circle-dracula";
      }

      @theme "~/.config/rofi/theme.rasi"


      // Main //
      window {
          height:                      12em;
          width:                       38em;
          transparency:                "real";
          fullscreen:                  false;
          enabled:                     true;
          cursor:                      "default";
          spacing:                     0em;
          padding:                     0em;
          border-color:                @main-br;
          background-color:            @main-bg;
      }
      mainbox {
          enabled:                     true;
          spacing:                     0em;
          padding:                     0em;
          orientation:                 vertical;
          children:                    [ "listbox" , "inputbar" ];
          background-color:            transparent;
      }


      // Lists //
      listbox {
          padding:                     0em;
          spacing:                     0em;
          orientation:                 horizontal;
          children:                    [ "listview" ];
          background-color:            transparent;
      }
      listview {
          padding:                     0.5em;
          spacing:                     0.2em;
          enabled:                     true;
          columns:                     5;
          cycle:                       true;
          dynamic:                     true;
          scrollbar:                   false;
          reverse:                     false;
          fixed-height:                true;
          fixed-columns:               true;
          cursor:                      "default";
          background-color:            @main-bg;
          text-color:                  @main-fg;
      }


      // Inputs //
      inputmode {
          padding:                     0em;
          spacing:                     0em;
          orientation:                 horizontal;
          children:                    [ "inputbar" , "mode-switcher" ];
          background-color:            transparent;
      }
      inputbar {
          enabled:                     true;
          width:                       24em;
          padding:                     0em;
          spacing:                     0em;
          padding:                     1.5em 1em 1.5em 2.5em;
          children:                    [ "entry" ];
          background-color:            transparent;
      }
      entry {
          vertical-align:              0.5;
          border-radius:               3em;
          enabled:                     true;
          spacing:                     0em;
          padding:                     1em;
          text-color:                  @main-fg;
          background-color:            @main-bg;
      }


      // Modes //
      mode-switcher {
          width:                       13em;
          orientation:                 horizontal;
          enabled:                     true;
          padding:                     1.5em 2.5em 1.5em 0em;
          spacing:                     1em;
          background-color:            transparent;
      }
      button {
          cursor:                      pointer;
          padding:                     0em;
          border-radius:               3em;
          background-color:            @main-bg;
          text-color:                  @main-fg;
      }
      button selected {
          background-color:            @main-fg;
          text-color:                  @main-bg;
      }


      // Elements //
      element {
          orientation:                 vertical;
          enabled:                     true;
          spacing:                     0.2em;
          padding:                     0.5em;
          cursor:                      pointer;
          background-color:            transparent;
          text-color:                  @main-fg;
      }
      element selected.normal {
          background-color:            @select-bg;
          text-color:                  @select-fg;
      }
      element-icon {
          size:                        2.5em;
          cursor:                      inherit;
          background-color:            transparent;
          text-color:                  inherit;
      }
      element-text {
          vertical-align:              0.5;
          horizontal-align:            0.5;
          cursor:                      inherit;
          background-color:            transparent;
          text-color:                  inherit;
      }


    '';

    ".config/rofi/clipboard.rasi".text = ''

// Config //
configuration {
    modi:                        "drun";
    show-icons:                  false;
}


@theme "~/.config/rofi/theme.rasi"

// Main //
window {
    width:                       23em;
    height:                      30em;
    transparency:                "real";
    fullscreen:                  false;
    enabled:                     true;
    cursor:                      "default";
    spacing:                     0em;
    padding:                     0em;
    border-color:                @main-br;
    background-color:            @main-bg;
}
mainbox {
    enabled:                     true;
    spacing:                     0em;
    padding:                     0.5em;
    orientation:                 vertical;
    children:                    [ "wallbox" , "listbox" ];
    background-color:            transparent;
}
wallbox {
    spacing:                     0em;
    padding:                     0em;
    expand:                      false;
    orientation:                 horizontal;
    background-color:            transparent;
    background-image:            url("~/.cache/hyde/wall.blur", width);
    children:                    [ "wallframe" , "inputbar" ];
}
wallframe {
    width:                       5em;
    spacing:                     0em;
    padding:                     0em;
    expand:                      false;
    background-color:            @main-bg;
    background-image:            url("~/.cache/hyde/wall.quad", width);
}


// Inputs //
inputbar {
    enabled:                     true;
    padding:                     0em;
    children:                    [ "entry" ];
    background-color:            @main-bg;
    expand:                      true;
}
entry {
    enabled:                     true;
    padding:                     1.8em;
    text-color:                  @main-fg;
    background-color:            transparent;
}


// Lists //
listbox {
    spacing:                     0em;
    padding:                     0em;
    orientation:                 vertical;
    children:                    [ "dummy" , "listview" , "dummy" ];
    background-color:            transparent;
}
listview {
    enabled:                     true;
    padding:                     0.5em;
    columns:                     1;
    lines:                       11; 
    cycle:                       true;
    fixed-height:                true;
    fixed-columns:               false;
    expand:                      false;
    cursor:                      "default";
    background-color:            transparent;
    text-color:                  @main-fg;
}
dummy {
    spacing:                     0em;
    padding:                     0em;
    background-color:            transparent;
}


// Elements //
element {
    enabled:                     true;
    padding:                     0.5em;
    cursor:                      pointer;
    background-color:            transparent;
    text-color:                  @main-fg;
}
element selected.normal {
    background-color:            @select-bg;
    text-color:                  @select-fg;
}
element-text {
    vertical-align:              0.0;
    horizontal-align:            0.0;
    cursor:                      inherit;
    background-color:            transparent;
    text-color:                  inherit;
}


'';

    ".config/rofi/selector.rasi".text = ''
            // Config //
            configuration {
                modi:                        "drun";
                show-icons:                  true;
                drun-display-format:         "{name}";
                font:                        "JetBrainsMono Nerd Font 10";
            }



      @theme "~/.config/rofi/theme.rasi"

            // Main //
            window {
                enabled:                     true;
                fullscreen:                  false;
                transparency:                "real";
                cursor:                      "default";
                spacing:                     0em;
                padding:                     0em;
                border:                      0em;
                border-radius:               0em;
                border-color:                transparent;
                background-color:            @main-bg;
            }
            mainbox {
                enabled:                     true;
                orientation:                 horizontal;
                children:                    [ "dummy", "frame", "dummy" ];
                background-color:            transparent;
            }
            frame {
                children:                    [ "listview" ];
                background-color:            transparent;
            }


            // Lists //
            listview {
                enabled:                     true;
                spacing:                     4em;
                padding:                     4em;
                columns:                     10;
                lines:                       1;
                dynamic:                     false;
                fixed-height:                false;
                fixed-columns:               true;
                reverse:                     true;
                cursor:                      "default";
                background-color:            transparent;
                text-color:                  @main-fg;
            }
            dummy {
                width:                       2em;
                expand:                      false;
                background-color:            transparent;
            }


            // Elements //
            element {
                enabled:                     true;
                spacing:                     0em;
                padding:                     0em;
                cursor:                      pointer;
                background-color:            transparent;
                text-color:                  @main-fg;
            }
            element selected.normal {
                background-color:            @select-bg;
                text-color:                  @select-fg;
            }
            element-icon {
                cursor:                      inherit;
                size:                        10em;
                background-color:            transparent;
                text-color:                  inherit;
                expand:                      false;
            }
            element-text {
                vertical-align:              0.5;
                horizontal-align:            0.5;
                cursor:                      inherit;
                background-color:            transparent;
                text-color:                  inherit;
            }
    '';
  };
}
