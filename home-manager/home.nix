{config, pkgs, pkgs-unstable ,...}:

{
  imports = [
    ./sway.nix
    ./i3status-rust.nix
    ./bash.nix
  ];

  home.username = "emily";
  home.homeDirectory = "/home/emily";
  home.stateVersion = "26.05";
  home.packages = [
    pkgs.firefox
    pkgs.kitty
    pkgs.fastfetch
  ];

}
