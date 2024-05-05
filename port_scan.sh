#!/bin/bash

# Usage function
usage() {
    echo "Usage: $0 <target_ip>"
    exit 1
}

# Check if target IP is provided
if [ -z "$1" ]; then
    usage
fi

# Set the target IP
target_ip="$1"

# Define a range of ports to scan
start_port=1
end_port=1000

# Function to perform port scan
port_scan() {
    for (( port=$start_port; port<=$end_port; port++ )); do
        # Redirect output to /dev/null to suppress unnecessary output
        timeout 1 bash -c "echo >/dev/tcp/$target_ip/$port" &>/dev/null && echo "Port $port is open"
    done
}

# Call the port_scan function
port_scan
