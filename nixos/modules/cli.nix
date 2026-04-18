# Everything related to the CLI goes here.
{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    bat
    bottom
    delve
    eza
    fd
    fzf
    gh
    lazydocker
    lazygit
    ripgrep
    opencode
    zoxide
  ];
}
