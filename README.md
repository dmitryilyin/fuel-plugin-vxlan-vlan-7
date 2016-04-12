fuel-plugin-vxlan-vlan-7
============

Overwiev 

By default Fuel deployes only one type of neutron segmentation available for tenant networks per deployment(choice is done while creating environment). 
Plugin can be used in VXLAN deployments to change neutron ml2 config file in order to configure VLAN ranges and bridge mappings.

Requirements 
------------
- MOS 7.0

Prerequisites
------------
- Correctc Fuel network-template as Plugin does not create any intefaces by itself and relay on templates to do this 

Installing the plugin
---------------------
- build plugin with fpb
- instal plugin via Fuel CLI

Configuring the plugin
---------------------
Plugin itself doesn't require configurtion. But before deploy environment correct network template has to be apploaded.
For network-template example take a look at lnx-br-bond.yaml

Verification
------------
You should be able to create VLAN sementation network. Please use *providernet* as phiscal netwotk name


