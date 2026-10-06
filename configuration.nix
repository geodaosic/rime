{ config, pkgs, pkgs-unstable, ... }:

{
  system.stateVersion = "26.05";
  
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "hostname";
  networking.networkmanager.enable = true;

  users.users.emily = {
    isNormalUser = true;
    description = "emily";
    extraGroups = [ "networkmanager" "wheel" ];
    initialPassword = "";
  };
  
  # X11
  #services.xserver.enable = true;
  
  # Enable SSH for convenience
  services.openssh.enable = true;

  # Basic packages
  environment.systemPackages = with pkgs; [
    vim
    wget
    git
  ];
  
  environment.variables.EDITOR = "vim";
 
  #autostart sway on login
  environment.loginShellInit = ''
    [[ "$(tty)" == /dev/tty1 ]] && sway
  '';

  programs.sway.enable = true;
  # Allow unfree packages if needed
  nixpkgs.config.allowUnfree = true;
}

