{ inputs, ... }:
{
  imports = [inputs.nixvim.nixDarwinModules.nixvim];
  programs.nixvim = {
    enable = true;
    plugins.lightline.enable = true;
    colorschemes.gruvbox.enable = true;
  };
} 