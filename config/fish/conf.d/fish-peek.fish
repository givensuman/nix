alias peek _fish_peek

function _fish_eza_install --on-event fish-eza_install
end

function _fish_eza_uninstall --on-event fish-eza_uninstall
    functions --erase peek
end

function _fish_eza_update --on-event fish-eza_update
    _fish_eza_uninstall
    _fish_eza_install
end
