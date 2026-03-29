system-dir := "/opt/goose"

default:
    @just --list

change-shell-to-fish:
    sudo usermod --shell $(which fish) $USER
