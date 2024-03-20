{ self, pkgs, ... }: {
  home.username = "mag";
  home.homeDirectory = "/Users/mag";
  home.stateVersion = "24.05";
  home.sessionVariables = {
    HELLO = "world!";
  };
  
  programs.zsh.enable = true;
  programs.zsh.shellAliases = {
    nixswitch = "darwin-rebuild switch --flake ${self}";
  };
}