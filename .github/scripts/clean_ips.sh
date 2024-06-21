#!/bin/bash

# This scripts takes a list of IPv4/6 CIDR-Ranges (one per line) from stdin, removes invalid lines and outputs the cleaned version

# Function to validate IPv4 CIDR
validate_ipv4_cidr() {
    local ip_cidr="$1"
    if [[ $ip_cidr =~ ^([0-9]{1,3}\.){3}[0-9]{1,3}(/[0-9]{1,2})?$ ]]; then
        IFS='/' read -r ip cidr <<< "$ip_cidr"
        IFS='.' read -r a b c d <<< "$ip"
        [[ $a -le 255 && $b -le 255 && $c -le 255 && $d -le 255 && ($cidr -eq 0 || $cidr -ge 8) && $cidr -le 32 ]]
        return $?
    fi
    return 1
}

# Function to validate IPv6 CIDR
validate_ipv6_cidr() {
    local ip_cidr="$1"
    if [[ $ip_cidr =~ ^([0-9a-fA-F]{1,4}:){7}[0-9a-fA-F]{1,4}(/[0-9]{1,3})?$ ]]; then
        IFS='/' read -r ip cidr <<< "$ip_cidr"
        [[ ($cidr -eq 0 || $cidr -ge 8) && $cidr -le 128 ]]
        return $?
    fi
    return 1
}

# Process input from stdin
while IFS= read -r line || [[ -n "$line" ]]; do
    if validate_ipv4_cidr "$line" || validate_ipv6_cidr "$line"; then
        echo "$line"
    fi
done

