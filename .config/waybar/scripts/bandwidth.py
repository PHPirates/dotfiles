#!/usr/bin/env python
"""
Script taken from https://github.com/Alexays/Waybar/issues/2162#issuecomment-1537366689

Modifications:
    * Units are fixed to Mbit
    * Changed icon
"""

import subprocess
from time import sleep


def default_interface():
    process = subprocess.run(
        ["ip", "route"], check=True, text=True, capture_output=True
    )
    for line in process.stdout.splitlines():
        if line.startswith("default via"):
            return line.split()[4]
    raise RuntimeError("No default interface found")


def get_rx_tx_bytes(iface):
    with open("/proc/net/dev") as f:
        for line in f:
            if not line.startswith(f"{iface}:"):
                continue
            rx_bytes = int(line.split()[1])
            tx_bytes = int(line.split()[9])
            return rx_bytes, tx_bytes
    raise RuntimeError("Interface not found")


def format_size(size):
    """
    :param size: Speed in bytes
    """
    return f"{size / 2**17:3.0f} Mbit"

def main():
    refresh_interval = 0.5
    rx_icon = " "  # " "
    tx_icon = " "  # " "
    num_left = "<span font='NotoSansMono'>"
    num_right = "</span>"
    fmt_str = (
        f"{rx_icon}{num_left}{{rx}}{{unit_suffix}}{num_right}  "
        f"{tx_icon}{num_left}{{tx}}{{unit_suffix}}{num_right}"
    )
    unit_suffix = ""
    iface = default_interface()

    rx_bytes, tx_bytes = get_rx_tx_bytes(iface)

    while True:
        prev_rx_bytes, prev_tx_bytes = rx_bytes, tx_bytes
        rx_bytes, tx_bytes = get_rx_tx_bytes(iface)
        drx = format_size((rx_bytes - prev_rx_bytes) / refresh_interval)
        dtx = format_size((tx_bytes - prev_tx_bytes) / refresh_interval)
        line = fmt_str.format(rx=drx, tx=dtx, unit_suffix=unit_suffix)
        print(line, flush=True)
        sleep(refresh_interval)


if __name__ == "__main__":
    main()
