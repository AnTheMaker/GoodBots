#!/bin/bash

# This scripts takes a list of IPv4/6 CIDR-Ranges (one per line) from stdin, removes invalid lines and outputs the cleaned version

# Function to validate IPv4 address or CIDR
validate_ipv4() {
    local ip_cidr="$1"
    if [[ $ip_cidr =~ ^([0-9]{1,3}\.){3}[0-9]{1,3}(/[0-9]{1,2})?$ ]]; then
        IFS='/' read -r ip cidr <<< "$ip_cidr"
        IFS='.' read -r a b c d <<< "$ip"
        [[ $a -le 255 && $b -le 255 && $c -le 255 && $d -le 255 && (-z "$cidr" || ($cidr -ge 0 && $cidr -le 32)) ]]
        return $?
    fi
    return 1
}

# Function to validate IPv6 address or CIDR
validate_ipv6() {
    local ip_cidr="$1"
    # Remove square brackets if present (for URL format)
    ip_cidr=${ip_cidr#[}
    ip_cidr=${ip_cidr%]}
    if [[ $ip_cidr =~ ^([0-9a-fA-F:]+)(/[0-9]{1,3})?$ ]]; then
        IFS='/' read -r ip cidr <<< "$ip_cidr"
        # Use grep to check if the IP part is valid
        if echo "$ip" | grep -qP '^(?:(?:[0-9a-fA-F]{1,4}:){7}[0-9a-fA-F]{1,4}|(?:[0-9a-fA-F]{1,4}:){1,7}:|(?:[0-9a-fA-F]{1,4}:){1,6}:[0-9a-fA-F]{1,4}|(?:[0-9a-fA-F]{1,4}:){1,5}(:[0-9a-fA-F]{1,4}){1,2}|(?:[0-9a-fA-F]{1,4}:){1,4}(:[0-9a-fA-F]{1,4}){1,3}|(?:[0-9a-fA-F]{1,4}:){1,3}(:[0-9a-fA-F]{1,4}){1,4}|(?:[0-9a-fA-F]{1,4}:){1,2}(:[0-9a-fA-F]{1,4}){1,5}|[0-9a-fA-F]{1,4}:((:[0-9a-fA-F]{1,4}){1,6})|:(?:(:[0-9a-fA-F]{1,4}){1,7}|:)|fe80:(:[0-9a-fA-F]{0,4}){0,4}%[0-9a-zA-Z]{1,}|::(ffff(:0{1,4}){0,1}:){0,1}((25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])\.){3,3}(25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])|([0-9a-fA-F]{1,4}:){1,4}:((25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])\.){3,3}(25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9]))$'; then
            [[ -z "$cidr" || ($cidr -ge 0 && $cidr -le 128) ]]
            return $?
        fi
    fi
    return 1
}

# Process input from stdin
while IFS= read -r line || [[ -n "$line" ]]; do
    # Remove carriage return if present
    line=${line%$'\r'}
    
    # Skip empty lines
    [[ -z "$line" ]] && continue
    
    # Validate and output non-empty lines containing valid IP addresses or CIDR notations
    if validate_ipv4 "$line" || validate_ipv6 "$line"; then
        echo "$line"
    fi
done

