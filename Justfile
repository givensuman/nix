host := "gandalf"

# Show this help
default:
    @just --list

_go-sudo:
  @sudo --validate

# Rebuild system
[group('util')]
rebuild: _go-sudo switch symlink-configs

# Rebuild system and destructively rebuild program caches
[group('util')]
teardown-and-rebuild: _go-sudo switch symlink-configs teardown-then-build

# Build and activate new system configuration
[group('nix')]
switch args='':
    sudo nixos-rebuild --flake '#{{ host }}' switch {{ args }}

# Build as a dry-run
[group('nix')]
build args='':
    sudo nixos-rebuild --flake '#{{ host }}' build {{ args }}

# Build and activate, with rollback on failure
[group('nix')]
test args='':
    sudo nixos-rebuild --flake '#{{ host }}' test {{ args }}

# Switch to previous generation
[group('nix')]
rollback:
    sudo /run/current-system/bin/switch-to-configuration switch

# Build documentation
[group('nix')]
docs:
    nixos-rebuild --flake '#{{ host }}' build --build-llvm-tools

# Update flake inputs
[group('nix')]
update:
    nix flake update

# Clean nix store
[group('nix')]
clean:
    sudo nix-collect-garbage -d

# Show current generations
[group('nix')]
generations:
    nix-env -p /nix/var/nix/profiles/system --list-generations

# Symlink dotfiles configs to ~/.config
[group('scripts')]
symlink-configs:
    @bash ./scripts/symlink-configs.sh

# Create timestamped backup of dotfiles
[group('scripts')]
backup-configs args='':
    @bash ./scripts/backup-configs.sh {{ args }}

# Destructively rebuild program caches
[group('scripts')]
teardown-then-build:
    @bash ./scripts/teardown-then-build.sh
