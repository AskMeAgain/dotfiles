{ config, pkgs, ... }: {
  users.users.dev = {
    hashedPassword = "$6$yvRAry3HvAaxVB5k$U0WFYDwAG3u/W1nYfy0oHJIf6z56tS5mY4XA4drsb2Ol1qklLq30/hm8bg.O0yH2.Fvxr6ilQXAquLSN6LFPD1";
  	isNormalUser = true;
  	home = "/home/dev";
  	description = "Dev Account";
  	extraGroups = [ "wheel" ];
  };
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
