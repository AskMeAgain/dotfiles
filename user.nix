{ config, pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = [
    pkgs.micro
    pkgs.ansible
    pkgs.google-chrome
    pkgs.dconf
    pkgs.tilix
    pkgs.yadm
    pkgs.gnome.seahorse
    pkgs.nerdfonts
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
  services.xserver.layout = "de";

  console.useXkbConfig = true;
}
