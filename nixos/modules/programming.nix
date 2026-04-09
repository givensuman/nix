{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    # CLI utilities
    bat
    bottom
    delve
    eza
    fd
    fzf
    gh
    lazygit
    ripgrep
    p7zip
    opencode
    shellcheck
    shfmt
    tree-sitter
    rust-analyzer
    zoxide

    # Random LazyVim dependencies
    imagemagick
    mermaid-cli
    sqlite
    tmux
    tectonic

    # Programming languages
    bun
    yarn
    deno
    nodejs_24
    lua
    ruby
    php
    jre8
    julia-lts
    python3
    cargo
    rustc
    go
  ];

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };

  # services.ollama = {
  #   enable = true;
  #   # loadModels = [ "gemma4:e4b" ];
  # };
}
