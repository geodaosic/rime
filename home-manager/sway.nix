{config, pkgs, pkgs_unstable,...}:

let
  mod="Mod4";
in 
{
  wayland.windowManager.sway = {
    enable = true;
    wrapperFeatures.gtk = true; #Do I need this? Common GTH app issues
    config = rec {
      modifier = mod;
      terminal = "kitty";
      keybindings = pkgs.lib.mkOptionDefault{
        "${mod}+Return" = "exec --no-startup-id ${terminal}";
        "${mod}+Shift+q" = "kill";
        "${mod}+space" = "exec --no-startup-id wofi";
      };
    };
  };

}
