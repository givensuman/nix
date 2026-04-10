{ pkgs, ... }:
{
  programs.fish = {
    enable = true;
    useBabelfish = true;
    interactiveShellInit = ''
      function world
          set -l world_dir $HOME/world
          set -l justfile "$world_dir/Justfile"

          if not test -d "$world_dir"
              echo "world: directory not found: $world_dir" >&2
              return 1
          end

          if not test -f "$justfile"
              echo "world: Justfile not found: $justfile" >&2
              return 1
          end

          if test (count $argv) -eq 0
              command just --working-directory "$world_dir" --justfile "$justfile" --list
              return $status
          end

          command just --working-directory "$world_dir" --justfile "$justfile" $argv
      end
    '';
  };
  environment.etc."fish/completions/world.fish".text = ''
    complete -c world -f
    complete -c world -a "(command just \
      --working-directory $HOME/world \
      --justfile $HOME/world/Justfile \
      --summary 2>/dev/null \
    )"
  '';
  programs.git.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Allow real-time priority for audio applications.
  security.pam.loginLimits = [
    {
      domain = "@audio";
      item = "memlock";
      type = "-";
      value = "unlimited";
    }
    {
      domain = "@audio";
      item = "rtprio";
      type = "-";
      value = "99";
    }
    {
      domain = "@audio";
      item = "nofile";
      type = "-";
      value = "99999";
    }
  ];

  environment.systemPackages = with pkgs; [
    vim
    wget
    curl
    unzip
    zip
    git
    just
    gcc
    htop
    libcap
    iotop
    strace
    lsof
    util-linux
    wl-clipboard
    less
  ];

  # Provide suggestions of packages to install when a command is not found.
  programs.command-not-found.enable = true;

  # Set Nix daemon to use lower scheduling priority.
  nix.daemonCPUSchedPolicy = "idle";
  nix.daemonIOSchedClass = "idle";

  # Enable hardware-accelerated graphics.
  hardware.graphics.enable = true;

  security.sudo-rs.enable = true;
}
