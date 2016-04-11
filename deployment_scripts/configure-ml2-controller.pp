$plugin_name            = "fuel-plugin-vxlan-vlan-7"
notice("MODULAR: ${plugin_name}/configure-ml2-controller.pp")

$plugin_metadata = hiera($plugin_name, false)
$vlan_bridge     = $plugin_metadata['vlan_bridge']

if $plugin_metadata {
  include neutron::params
  neutron_plugin_ml2 {
    'ml2_type_vlan/network_vlan_ranges': value => 'providernet:2:4094';
    'ovs/bridge_mappings':               value => "providernet:${vlan_bridge}";
  }

  service { 'neutron-server':
    ensure  => running,
    enable  => true,
  } ->
  service { 'neutron-ovs-agent-service':
    name       => $::neutron::params::ovs_agent_service,
    enable     => true,
    ensure     => running,
    hasstatus  => true,
    hasrestart => false,
    provider   => 'pacemaker',
  }

  Neutron_plugin_ml2<||> ~> Service['neutron-server', 'neutron-ovs-agent-service']

}
