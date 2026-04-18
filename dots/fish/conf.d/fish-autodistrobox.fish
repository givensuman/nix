function _extract_box_name_from_ini
    grep -m 1 '^\[.+\]' $argv[1] | tr -d '[]'
end

function _fish_autodistrobox_auto --on-variable PWD
    if not test -f distrobox.ini
        return 0
    end

    set -l name (_extract_box_name_from_ini distrobox.ini)

    if test -z "$name"
        echo "distrobox.ini was found but the image name couldn't be resolved"
        echo "see `man distrobox-assemble` for more information"
    end

    # Auto-assembly
    set -l box_exists 0
    if test -n (distrobox list | grep -w " $name ")
        set box_exists 1
    end

    if test $box_exists -eq 0; and not command -q $distrobox_disable_auto_assemble
        distrobox assemble create --replace --file distrobox.ini
    end

    # Auto-entry
    if command -q $distrobox_disable_auto_enter
        return 0
    end
    distrobox enter "$name"
end

if not command -q distrobox
    echo "distrobox is not installed but you're"
    echo "sourcing the fish plugin for it"
    return 1
else if not command -q distrobox-assemble
    echo "distrobox-assemble is not installed but you're"
    echo "sourcing the fish plugin for it"
    return 1
end

function _fish_autodistrobox_install --on-event fish-autodistrobox_install
end

function _fish_autodistrobox_uninstall --on-event fish-autodistrobox_uninstall
    functions --erase _extract_box_name_from_ini
    functions --erase _fish_autodistrobox_auto

    set --erase distrobox_disable_auto_assemble
    set --erase distrobox_disable_auto_enter
    set --erase distrobox_init_template
end

function _fish_autodistrobox_update --on-event fish-autodistrobox_update
    _fish_autodistrobox_uninstall
    _fish_autodistrobox_install
end
