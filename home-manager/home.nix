{config, pkgs, pkgs-unstable ,...}

{
  home.username = "emily";
  home.homeDirectory = "/home/emily";

  home.packages = [
    pkgs.cowsay
  ];

  #programs.home-manager.enable = true;
}
