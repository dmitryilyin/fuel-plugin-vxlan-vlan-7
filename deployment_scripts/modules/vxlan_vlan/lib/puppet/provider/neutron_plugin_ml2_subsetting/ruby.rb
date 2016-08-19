Puppet::Type.type(:neutron_plugin_ml2_subsetting).provide(
    :ruby,
    :parent => Puppet::Type.type(:ini_subsetting).provider(:ruby)
) do

  def neutron_plugin_ml2_provider
    type = Puppet::Type.type(:neutron_plugin_ml2)
    fail 'Could not load the Puppet type: "neutron_plugin_ml2"' unless type.is_a? Puppet::Type
    provider = type.provider(:ini_setting)
    fail 'Could not load provider "ini_setting" of the type "neutron_plugin_ml2"!' unless provider.is_a? Puppet::Provider
    provider
  end

  def file_path
    return @file_path if @file_path
    @file_path = neutron_plugin_ml2_provider.file_path
  end
end
