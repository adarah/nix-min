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
  
  system.defaults.dock.autohide = true;
  # Makes switching spaces faster
  system.defaults.universalaccess.reduceMotion = true;
  # Recommended by Amethyst docs
  system.defaults.dock.mru-spaces = false;
  # TODO: Once https://github.com/LnL7/nix-darwin/pull/699 is merged, I can define shortcuts in my config
  # Until then, I'll just document them here. Modified via System Preferences > Keyboard > Shortcuts > Mission Control
  # option-shift-(1 through 9): Open workspace (1 through 9)
  # option-shift-0: Open workspace 10
  
  homebrew.enable = true;
  homebrew.casks = [
    "1password"
    "amethyst"
    "arc"
  ];
  programs.zsh.enable = true;
}