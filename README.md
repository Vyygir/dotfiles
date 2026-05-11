# ⚫📋

>[!WARNING]
>There was only a bare minimum effort to organise these and remains a work in progress. Use at your own risk.

These are my dotfiles.

Frankly, I'm only putting them here as a super-fallback solution because I'm backed up locally pretty well.

That being said, feel free to reference them as you need to. It's not _that_ complex.

## System

| Layer |  |
| Operating System | Void Linux |
| Window Manager   | Hyprland (Wayland) |
| "Bars"           | Noctalia |
| Shell            | zsh |
| Terminal         | kitty |
| Editor           | helix |

### Dependencies

This isn't a complete or curated list but it's definitely a subset of packages that are definitely referenced in my configurations.

>[!NOTE]
>Some of these aren't in the **xbps** repositories, meaning you're either going to have to build them locally or use an alternative repository (listed further down).

```
hyprland
hypridle
hyprpicker
hyprshot
xdg-desktop-portal
xdg-desktop-portal-hyprland
xdg-desktop-portal-gtk
wl-clipboard
pipewire
wireplumber
pavucontrol
dbus
grim
jq
noctalia-shell
kitty
helix
starship
fastfetch
moar
keychain
gsettings-*
goxlr-daemon
rustup
zvm
```

### Alternative Repositories

These need to go into `/etc/xbps.d/` to be scanned as additional remotes.

```sh
# 10-hyprland.conf
repository=https://raw.githubusercontent.com/sofijacom/hyprland-void/repository-x86_64-glibc
```
```sh
# 10-noctalia.conf
repository=https://universalrepository.pages.dev/void
```
