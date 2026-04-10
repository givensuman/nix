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

  # services.ollama = {
  #   enable = true;
  #   # loadModels = [ "gemma4:e4b" ];
  # };
}
