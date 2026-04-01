{
  description = "given's NixOS flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flatpaks.url = "github:gmodena/nix-flatpak";
  };

  outputs = {
    self,
    nixpkgs,
    flatpaks,
    ...
  } @ inputs: {
    nixosConfigurations.gandalf = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [./nixos/configuration.nix];
    };
  };
}
