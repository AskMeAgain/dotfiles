{ config, pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;
  services.xserver.windowManager.i3.configFile = "/home/dev/.i3/config";
  fonts.fonts = with pkgs; [
    (nerdfonts.override { fonts = [ "SourceCodePro" ]; })
  ];
  environment.systemPackages = [
    pkgs.micro
    pkgs.ansible
    pkgs.google-chrome
    pkgs.dconf
    pkgs.tilix
    pkgs.yadm
    pkgs.gnome.seahorse
    pkgs.jq
    pkgs.xclip
    pkgs.postman
    pkgs.fzf
    pkgs.rofi
    pkgs.polybar
    pkgs.feh
    pkgs.ranger
    pkgs.rofi
    pkgs.docker
    pkgs.zsh
    pkgs.zsh-completions
    pkgs.zsh-powerlevel10k
    pkgs.flameshot
    pkgs.peek
    pkgs.python311Packages.pygments
    pkgs.pywal
    pkgs.zsh-syntax-highlighting
    pkgs.zsh-history-substring-search
    pkgs.gnused
    pkgs.picom
  ];
}
