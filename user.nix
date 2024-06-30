{ config, pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;

  services = {
  	xserver = {
  		layout = "de";
  		xkbVariant = "";
  		enable = true;
  		windowManager = {
  			i3 = {
  				configFile = "/home/dev/.i3/config";
  				enable = true;
  			};
  		};
  		displayManager = {
  			defaultSession = "none+i3";
  			autoLogin.user = "dev";
  		};
  	};
  };
  
  fonts.fonts = with pkgs; [
    (nerdfonts.override { fonts = [ "SourceCodePro" ]; })
  ];
  imports = [ <home-manager/nixos> ];
  home-manager.users.dev = { pkgs, ... }: {
  	home.stateVersion = "23.05";
  	programs.home-manager.enable = true;
  	home.username = "dev";
  	home.homeDirectory = "/home/dev";
    programs.zsh = {
      historySubstringSearch.enable = true;
      enable = true;
      enableVteIntegration = true;
      enableCompletion = true;
      enableAutosuggestions = true;
      enableSyntaxHighlighting = true;
      oh-my-zsh = {
        enable = true;
        plugins = [ "git" ];
        theme = "dst";
      };
      plugins = [
        {
          name = "powerlevel10k";
          src = pkgs.zsh-powerlevel10k;
          file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
        }
        {
          name = "powerlevel10k-config";
          src = "/home/dev/";
          file = ".p10k.zsh";
        }
      ];
    };
    programs.fzf = {
        enable = true;
        enableZshIntegration = true;
    };
  };
  programs.zsh.enable = true;
  users.users.dev.shell = pkgs.zsh;
  system.activationScripts.myOnceScript = ''
  	  source ${config.system.build.setEnvironment}
      curl -s "https://get.sdkman.io" | bash
    '';
   virtualisation.docker.enable = true;
#  system.activationScripts.myOnceScript = ''
#        #!/bin/bash
#        xrandr --newmode "1920x1080_60.00"  172.80  1920 2040 2248 2576  1080 1081 1084 1118  -HSync +Vsync;
#        xrandr --addmode Virtual-1 "1920x1080_60.00";
#        xrandr --output Virtual-1 --mode "1920x1080_60.00";
#      '';
  environment.systemPackages = [
    pkgs.micro
    pkgs.git
    pkgs.ansible
    pkgs.google-chrome
    pkgs.dconf
    pkgs.tilix
    pkgs.yadm
    pkgs.gnome.seahorse
    pkgs.jq
    pkgs.unzip
    pkgs.zip
    pkgs.jetbrains.idea-ultimate
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
    pkgs.flameshot
    pkgs.peek
    pkgs.python311Packages.pygments
    pkgs.pywal
    pkgs.gnused
    pkgs.picom
  ];
}
