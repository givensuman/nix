# Everything related to programming languages goes here.
{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    bun
    yarn
    deno
    pnpm
    nodejs_24
    lua
    ruby
    php
    perl
    jre8
    kotlin
    julia-lts
    mitscheme
    python3
    uv
    cargo
    rustc
    go
    zig
  ];

  environment.variables = {
    GOPATH = "$HOME/.go";
  };
}
