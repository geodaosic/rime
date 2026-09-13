{config, pkgs, pkgs-unstable ,...}:

{
  home.username = "emily";
  home.homeDirectory = "/home/emily";
  home.stateVersion = "25.05";
  home.packages = [
    pkgs.cowsay
    pkgs.firefox
    pkgs.alacritty
  ];


  # This is the starting script? this is weird but maybe it is what I want until I can get a login thing that looks nicer
  home.file.".bash_profile".text = ''
    if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
      exec startx
    fi
  '';

  home.file.".xinitrc".text = ''
    exec i3
  '';

  xsession.windowManager.i3 = {
    enable = true;
    config = {
      terminal = "alacritty";

      keybindings = {
	"$Mod1+Return" = "exec i3-sensible-terminal";
	
      };
    };
  };

}
