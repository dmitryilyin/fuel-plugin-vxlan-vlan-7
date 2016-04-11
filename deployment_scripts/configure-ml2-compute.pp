$plugin_name            = "fuel-plugin-vxlan-vlan-7"
notice("MODULAR: ${plugin_name}/configure-ml2-compute.pp")

$plugin_metadata = hiera($plugin_name, false)
$vlan_bridge     = $plugin_metadata['vlan_bridge']

if $plugin_metadata {
  neutron_plugin_ml2 {
    'ml2_type_vlan/network_vlan_ranges': value   => 'providernet:2:4094';
    'ovs/bridge_mappings': value                 => "providernet:${vlan_bridge}";
  } ~> Service['neutron-plugin-openvswitch-agent']

  service { 'neutron-plugin-openvswitch-agent':
    ensure  => running,
    enable  => true,
  }

}
