{ config, pkgs, ... }:
{
  programs.kitty.enable = true;

  programs.kitty.extraConfig = ''
    font_family      CaskaydiaCove Nerd Font Mono
    #font_family      Maple Mono NF Regular
bold_font        Maple Mono NF Regular
italic_font      Maple Mono NF Regular
    tab_bar_style hidden
    background_opacity .7


    font_size 13.5
    # window_padding_width 25
    include theme.conf
    hide_window_decorations yes
    confirm_os_window_close 0
    map ctrl+backspace send_text all \x17
    allow_remote_control yes
    enabled_layouts tall
    cursor_blink_interval 0
    copy_on_select yes
    scrollback_lines 2000
    scrollback_pager less --chop-long-lines --RAW-CONTROL-CHARS +INPUT_LINE_NUMBER
    mouse_map middle release ungrabbed paste_from_selection
    shell zsh



    # themes
    # #foreground              #FFFFFF
    # #background              #070408
    # selection_foreground    #070408
    # selection_background    #FFFFFF
    # cursor                  #80516D 
    # cursor_text_color       #FFFFFF
    # active_tab_foreground     #070408
    # active_tab_background     #493154
    # inactive_tab_foreground   #493154
    # inactive_tab_background   #070408
    # # black
    # color0      #472952
    # color8      #81578F
    # # red
    # color1      #FFCCEA
    # color9      #F0AAD4
    # # green
    # color2      #DFCCFF
    # color10     #C5AAF0
    # # yellow
    # color3      #EFCCFF
    # color11     #DAAAF0
    # # blue
    # color4      #D39AE6
    # color12     #D39AE6
    # # magenta
    # color5      #B69AE6
    # color13     #B69AE6
    # # cyan
    # color6      #CE9AE6
    # color14     #CE9AE6
    # # white
    # color7      #FFCCEA
    # color15     #F0AAD4
    #

    #Decay Green

    #background #0d0f18
    foreground #a5b6cf
    # Black
    color0 #151720
    color8 #1c1e27
    # Red
    color1 #dd6777
    color9 #e26c7c
    # Green
    color4  #90ceaa
    color12 #95d3af
    # Yellow
    color3  #ecd3a0
    color11 #f1d8a5
    # Blue
    color2  #86aaec
    color10 #8baff1
    # Magenta
    color5  #c296eb
    color13 #c79bf0
    # Cyan
    color6  #93cee9
    color14 #98d3ee
    # White
    color7  #cbced3
    color15 #d0d3d8
    # Cursor
    cursor #cbced3
    cursor_text_color #a5b6cf
    # Selection highlight
    selection_foreground #a5b6cf
    selection_background #1c1e27


    # # vim:ft=kitty
    #
    # ## name: Tokyo Night
    # ## license: MIT
    # ## author: Folke Lemaitre
    # ## upstream: https://github.com/folke/tokyonight.nvim/raw/main/extras/kitty/tokyonight_night.conf
    #
    #
    # background #1a1b26
    # foreground #c0caf5
    # selection_background #283457
    # selection_foreground #c0caf5
    # url_color #73daca
    # cursor #c0caf5
    # cursor_text_color #1a1b26
    #
    # # Tabs
    # active_tab_background #7aa2f7
    # active_tab_foreground #16161e
    # inactive_tab_background #292e42
    # inactive_tab_foreground #545c7e
    # #tab_bar_background #15161e
    #
    # # Windows
    # active_border_color #7aa2f7
    # inactive_border_color #292e42
    #
    # # normal
    # color0 #15161e
    # color1 #f7768e
    # color2 #9ece6a
    # color3 #e0af68
    # color4 #7aa2f7
    # color5 #bb9af7
    # color6 #7dcfff
    # color7 #a9b1d6
    #
    # # bright
    # color8 #414868
    # color9 #f7768e
    # color10 #9ece6a
    # color11 #e0af68
    # color12 #7aa2f7
    # color13 #bb9af7
    # color14 #7dcfff
    # color15 #c0caf5
    #
    # # extended colors
    # color16 #ff9e64
    # color17 #db4b4b

  '';
}

