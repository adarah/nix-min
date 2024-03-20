{ pkgs, ... }: {
  users.users.mag.home = "/Users/mag";
  system.stateVersion = 4;
  nix.useDaemon = true;
  nixpkgs.config = {
    allowUnfree = true;
  };
  nix.extraOptions = ''
    extra-experimental-features = nix-command flakes
  '';
  
  homebrew.enable = true;
  homebrew.casks = [
    "amethyst"
    "arc"
  ];
  programs.zsh.enable = true;
}