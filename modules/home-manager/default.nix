{ pkgs, kitty-icon, ... }: 
{
  home.username = "mag";
  home.homeDirectory = "/Users/mag";
  home.stateVersion = "24.05";
  home.sessionVariables = {
    EDITOR = "nvim";
  };
  
  home.packages = [
    pkgs.nil  # Nix LSP
  ];
  
  programs.zsh.enable = true;
  programs.zsh.enableCompletion = true;
  programs.zsh.autosuggestion.enable = true;
  programs.zsh.syntaxHighlighting.enable = true;
  programs.zsh.history.extended = true;
  programs.zsh.defaultKeymap = "viins";
  programs.zsh.shellAliases = {
    nixswitch = "darwin-rebuild switch --flake ~/Projects/nix-min";
  };
  
  programs.starship.enable = true;
  programs.kitty.package = pkgs.kitty.overrideAttrs (o: {
    postInstall = (o.postInstall or "") + ''
      cp ${kitty-icon}/kitty-dark.icns $out/Applications/kitty.app/Contents/Resources/kitty.icns
    '';
  });
  programs.kitty.enable = true;
  programs.kitty.font.name = "MesloLGS Nerd Font Mono";
  programs.kitty.font.size = 14;
  programs.kitty.theme = "Catppuccin-Frappe";
  
  
  programs.zoxide.enable = true;
}