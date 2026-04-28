# Everything related to Neovim goes here.
{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    defaultEditor = true;
  };

  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      vimPlugins.markdown-preview-nvim
    ];
  };

  # :checkhealth
  environment.systemPackages = with pkgs; [
    # copilot.nvim
    copilot-language-server

    # conform.nvim
    nixfmt
    prettier
    markdown-toc
    markdownlint-cli2
    shellcheck
    shfmt
    rust-analyzer

    # nvim-treesitter
    tree-sitter

    # sidekick.nvim
    tmux

    # Snacks.image
    imagemagick
    tectonic

    # Snacks.picker
    sqlite

    # ...
    luajit
    luajitPackages.rocks-nvim
    statix
  ];
}
