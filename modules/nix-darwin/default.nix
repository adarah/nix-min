{ pkgs, ... }: {
  users.users.mag.home = "/Users/mag";
  system.stateVersion = 4;
  programs.zsh.enable = true;
  nix.useDaemon = true;
  nixpkgs.config = {
    allowUnfree = true;
  };
  nix.extraOptions = ''
    extra-experimental-features = nix-command flakes
  '';
}