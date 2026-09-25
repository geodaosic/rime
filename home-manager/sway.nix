{config, pkgs, pkgs_unstable,...}:

let
  mod="Mod4";
in 
{
  wayland.windowManager.sway = {
    enable = true;
    wrapperFeatures.gtk = true; #Do I need this? Common GTH app issues
    config = {
      modifier = mod;
      terminal = "kitty";
      keybindings = pkgs.lib.mkOptionDefault{
        "${mod}+Return" = "exec ${terminal}";
        "${mod}+Shift+q" = "kill";
      };
    };
  };

}
