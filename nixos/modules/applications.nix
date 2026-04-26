{ pkgs, inputs, ... }:
{
  imports = [
    inputs.flatpaks.nixosModules.nix-flatpak
  ];

  services.flatpak.packages = [
    # Pinned
    "com.spotify.Client"
    "io.github.milkshiift.GoofCord"
    "org.localsend.localsend_app"
    "de.haeckerfelix.Fragments"
    "io.podman_desktop.PodmanDesktop"
    # Additional
    "dev.edfloreshz.Tasks"
    "org.nickvision.tubeconverter"
    "io.github.kriptolix.Poliedros"
    "de.til7701.Puzzled"
  ];

  environment.systemPackages = with pkgs; [
    steam
  ];
}
