--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

hl.workspace_rule({ workspace = "1", monitor = "HDMI-A-1" })
hl.workspace_rule({ workspace = "2", monitor = "eDP-1" })
hl.workspace_rule({ workspace = "3", monitor = "HDMI-A-1" })
hl.workspace_rule({ workspace = "4", monitor = "eDP-1" })
hl.workspace_rule({ workspace = "5", monitor = "eDP-1" })
hl.workspace_rule({ workspace = "6", monitor = "eDP-1" })
hl.workspace_rule({ workspace = "7", monitor = "eDP-1" })
hl.workspace_rule({ workspace = "8", monitor = "eDP-1" })

hl.window_rule({ match = { class = "jetbrains-idea" }, workspace = "1" })
hl.window_rule({ match = { class = "jetbrains-idea-ce" }, workspace = "2" })
hl.window_rule({ match = { title = ".*pdf-viewer-dev.*" }, workspace = "2" })
hl.window_rule({ match = { class = "chromium" }, workspace = "3" })
hl.window_rule({ match = { class = "firefox" }, workspace = "4" })
hl.window_rule({ match = { class = "org.mozilla.Thunderbird" }, workspace = "5" })
hl.window_rule({ match = { class = "org.gnome.SystemMonitor" }, workspace = "6" })
hl.window_rule({ match = { class = "KeePass2" }, workspace = "7" })
hl.window_rule({ match = { class = "zim" }, workspace = "7" })
hl.window_rule({ match = { class = "spotify" }, workspace = "8" })

hl.window_rule({
    match = { class = "clipse" },
    float = true,
    size  = { 622, 652 },
})

hl.window_rule({
    name  = "suppress-maximize-events",
    match = { class = ".*" },
    suppress_event = "maximize",
})

hl.window_rule({
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },
    no_focus = true,
})

hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },
    move  = { 20, "monitor_h-120" },
    float = true,
})
