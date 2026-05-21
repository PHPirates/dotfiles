-------------------
---- AUTOSTART ----
-------------------

hl.on("hyprland.start", function()
    -- Trick Dropbox into thinking it runs in a supported DE
    hl.exec_cmd("sleep 1 && DISPLAY=:0 DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus XDB_CURRENT_DESKTOP=xfce dropbox")
    hl.exec_cmd("sleep 10 && thunderbird &") -- Wait on network
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("hyprsunset")
    hl.exec_cmd("clipse -listen")
    hl.exec_cmd("waybar")
    hl.exec_cmd("sleep 10 && firefox &") -- Wait on network
    hl.exec_cmd("sleep 1 && gnome-system-monitor")
    hl.exec_cmd("sleep 1 && zim")
    hl.exec_cmd("sleep 1 && idea")
end)
