username: { pkgs, kitty-icon, ... }: 
{
  home.username = username;
  home.homeDirectory = "/Users/${username}";
  home.stateVersion = "24.05";
  home.sessionVariables = {
    EDITOR = "nvim";
    # Fixes the annoying delay when pressing escape in zsh
    KEYTIMEOUT = 1;
  };
  
  home.packages = [
    pkgs.nil  # Nix LSP
    pkgs.fx  # JSON terminal viewer
    pkgs.httpie
    pkgs.nixpkgs-fmt
  ];
  
  programs.zsh.enable = true;
  programs.zsh.enableCompletion = true;
  programs.zsh.autosuggestion.enable = true;
  programs.zsh.syntaxHighlighting.enable = true;
  programs.zsh.defaultKeymap = "viins";
  programs.zsh.shellAliases = {
    nixswitch = "darwin-rebuild switch --flake ~/Projects/nix-min";
    man = "batman";
  };
  programs.zsh.initExtra = ''
    # Enables backspace in insert mode
    bindkey -M viins '^?' backward-delete-char
  '';
  
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
  
  programs.tealdeer.enable = true;
  
  programs.atuin.enable = true;

  programs.bat.enable = true;
  programs.bat.extraPackages = with pkgs.bat-extras; [ batdiff batman batgrep batwatch ];
  
  programs.bottom.enable = true;
  
  programs.direnv.enable = true;
  
  programs.eza.enable = true;
  
  programs.fzf.enable = true;
  
  programs.git.enable = true;

  programs.jq.enable = true;
  
  programs.less.enable = true;
  
  programs.navi.enable = true;
  
  programs.neovim.enable = true;
  
  programs.ripgrep.enable = true;
  
}
