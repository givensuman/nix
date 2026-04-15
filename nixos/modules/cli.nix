# Everything related to the CLI goes here.
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
    mise
    lazydocker
    lazygit
    ripgrep
    opencode
    zoxide

    # Programming languages
    # bun
    # yarn
    # deno
    # nodejs_24
    # lua
    # ruby
    # php
    # jre8
    # julia-lts
    # python3
    # cargo
    # rustc
    # go
  ];

  # services.ollama = {
  #   enable = true;
  #   # loadModels = [ "gemma4:e4b" ];
  # };
}
