{ inputs, ... }:
{
  imports = [
    inputs.flatpaks.nixosModules.nix-flatpak
  ];

  services.flatpak.packages = [
    "com.spotify.Client"
    "io.github.milkshiift.GoofCord"
    "org.localsend.localsend_app"
    "de.haeckerfelix.Fragments"
    "io.podman_desktop.PodmanDesktop"
  ];
}
