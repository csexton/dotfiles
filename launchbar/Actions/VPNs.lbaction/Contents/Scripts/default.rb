#!/usr/bin/env ruby
#
# Copyright (c) 2014 Objective Development Software GmbH
# http://www.obdev.at/

require 'json'

# Returns an array of VPN names that match the given status.
# Status can be something like "Connected", "Connecting" or "Disconnected".
def vpns_with_status(status)
    output = `/usr/sbin/scutil --nc list | /usr/bin/grep -e "^\* (#{status})" | /usr/bin/awk --re-interval '{match($0, /".*"/ ); print substr($0, RSTART+1, RLENGTH-2); }'`.strip

    output.split("\n")
end

# Retuns the type of a VPN with the given name.
# For example "PPP:L2TP" or "PPP:Bluetooth"
def type_of_vpn(vpn_name)
    `/usr/sbin/scutil --nc show "#{vpn_name}" | /usr/bin/head -1 | /usr/bin/awk --re-interval '{match($0, /\\[.*\\]$/ ); print substr($0, RSTART+1, RLENGTH-2); }'`.strip
end

# Returns an item for the given VPN name that LaunchBar can parse.
def item_for_vpn(vpn_name, suffix, is_active)
    vpn = {}
    vpn['title'] = suffix == nil ? vpn_name : vpn_name + " (" + suffix + ")"
    vpn['subtitle'] = type_of_vpn(vpn_name)
    vpn['icon'] = is_active ? 'VPN-active.png' : 'VPN.png'

    # When this item is opened in LaunchBar, execute toggleVPN.rb with the VPN's name as an argument.
    vpn['action'] = 'toggleVPN.rb'
    vpn['actionArgument'] = vpn_name

    vpn
end


result = [];

vpns_with_status("Connected").each { | vpn_name |
    result.push(item_for_vpn(vpn_name, "Connected", true))
}

vpns_with_status("Connecting").each { | vpn_name |
    result.push(item_for_vpn(vpn_name, "Connecting", true))
}

vpns_with_status("Disconnected").each { | vpn_name |
    result.push(item_for_vpn(vpn_name, nil, false))
}

# Output the array of result items in JSON so LaunchBar can parse it:
puts result.to_json
