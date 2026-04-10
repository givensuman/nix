{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    defaultEditor = true;
  };

  environment.systemPackages = with pkgs; [
    # copilot.nvim
    copilot-language-server

    # conform.nvim
    nixfmt
    prettier
    markdown-toc
    markdownlint-cli2

    # nvim-treesitter
    tree-sitter

    # sidekick.nvim
    tmux

    # Snacks.image
    imagemagick
    tectonic

    # Snacks.picker
    sqlite

    # Neovim dependencies
    luajit
    luajitPackages.rocks-nvim
  ];
}
