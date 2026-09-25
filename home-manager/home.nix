{config, pkgs, pkgs-unstable ,...}:

{
  imports = [
    ./sway.nix
  ];

  home.username = "emily";
  home.homeDirectory = "/home/emily";
  home.stateVersion = "26.05";
  home.packages = [
    pkgs.firefox
    pkgs.kitty
  ];


  programs.i3status-rust = {
    enable = true;
  };

}
