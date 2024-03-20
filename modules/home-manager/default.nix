{ self, pkgs, ... }: {
  home.username = "mag";
  home.homeDirectory = "/Users/mag";
  home.stateVersion = "24.05";
  home.sessionVariables = {
    HELLO = "world!";
  };
  
  home.packages = [
    pkgs.kitty
    pkgs.nil  # Nix LSP
  ];
  
  programs.zsh.enable = true;
  programs.zsh.enableCompletion = true;
  programs.zsh.autosuggestion.enable = true;
  programs.zsh.syntaxHighlighting.enable = true;
  programs.zsh.history.extended = true;
  programs.zsh.defaultKeymap = "viins";
  programs.zsh.shellAliases = {
    nixswitch = "darwin-rebuild switch --flake ${self}";
  };
  
  programs.starship.enable = true;
}