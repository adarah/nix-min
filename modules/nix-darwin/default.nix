username: {pkgs, ...}: {
  users.users.mag.home = "/Users/${username}";
  system.stateVersion = 4;
  nix.useDaemon = true;
  nixpkgs.config = {
    allowUnfree = true;
  };
  nix.extraOptions = ''
    extra-experimental-features = nix-command flakes
  '';

  nix.settings.trusted-users = [
    "mag"
  ];
  nix.settings.substituters = [
    "https://nix-community.cachix.org"
    "https://devenv.cachix.org"
  ];
  nix.settings.trusted-substituters = [
    "https://nix-community.cachix.org"
    "https://devenv.cachix.org"
  ];
  nix.settings.trusted-public-keys = [
    "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    "devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw="
  ];

  fonts.fontDir.enable = true;
  fonts.fonts = [(pkgs.nerdfonts.override {fonts = ["Meslo"];})];

  system.defaults.NSGlobalDomain.InitialKeyRepeat = 15;
  # Makes the keyboard repeat faster
  system.defaults.NSGlobalDomain.KeyRepeat = 3;
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
  homebrew.brews = [
    "zoxide"
    "watson"
    "jq"
  ];
  homebrew.casks = [
    "1password"
    "amethyst"
    "arc"
    "raycast"
  ];
  programs.zsh.enable = true; 
}
