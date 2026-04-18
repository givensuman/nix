function distrobox-init --description "Initialize a distrobox.ini file in the current directory"
    if test -f distrobox.ini
        echo "distrobox.ini already exists in"
        echo "the current directory"

        return 1
    end

    set -l box_name (pwd | string trim -l -c / | string replace -a / -)

    if set -q $distrobox_init_template
        echo "[$box_name]" >distrobox.ini
        echo $distrobox_init_template >>distrobox.ini
    else
        echo "\
        [$box_name]
        image=ghcr.io/ublue-os/ubuntu-toolbox:latest
        init=false
        nvidia=false
        pull=true
        root=false
        replace=true
        entry=false
        start_now=true
        # ---
        # distrobox.int/usage/distrobox-assemble
        # ---
        # additional_flags=" "
        # additional_packages=" "
        # home = " "
        # hostname = " "
        # clone = " "
        # include = " "
        # init_hooks = " "
        # pre_init_hooks = " "
        # volume = " "
        # exported_apps = " "
        # exported_bins = " "
        # exported_bins_path = " "
        # unshare_groups = false
        # unshare_ipc = false
        # unshare_netns = false
        # unshare_process = false
        # unshare_devsys = false
        # unshare_all = false
      "
    end
end
