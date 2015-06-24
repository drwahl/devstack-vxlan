Vagrant.configure("2") do |config|

#  defaults = {}
#  default = {
#    "hostname" => "devstack-vxlan",
#    "box_name" => "dummy",
#    "box_url" => "https://github.com/cloudbau/vagrant-openstack-plugin/raw/master/dummy.box",
#    "box_ssh_username" => "vagrant",
#    "create_private_network" => true,
#    "openstack" => {
#      "username" => "davwah3",
#      "api_key" => "wahls#13913118",
#      "endpoint" => "https://keystone.dream.io/v2.0/tokens",
#      "keypair_name" => "dwahlstrom",
#      "ssh_username" => "dhc-user",
#      "tenant" => "DrWahl.me",
#      "networks" => ["private-network"]
#    },
#  }
#
#  config.nodes.each do |key, data|
#    # Set some default values for configuration options
#    defaults[key] = default
#  end
#  config.defaults = {"nodes" => defaults}
#
#  config.nodes.each do |key, data|
#    config.vm.define key do |node|

 config.ssh.private_key_path = '~/.ssh/id_rsa'
 config.vm.box = 'dummy'
 config.vm.box_url = 'https://github.com/cloudbau/vagrant-openstack-plugin/raw/master/dummy.box'

 config.vm.provider :openstack do |os|
      os.username = 'user'
      os.api_key = 'pass'
      os.flavor = 'lightspeed'
      os.image = 'Ubuntu-14.04-Trusty'
      os.endpoint = 'https://keystone.dream.io/v2.0/tokens'
      os.keypair_name = 'keypair'
      os.ssh_username = 'dhc-user'
      os.tenant = 'tenant'
      os.network = 'private-network'
      os.hostname = 'devstack-vxlan'
      os.floating_ip = :auto
      os.floating_ip_pool = 'public-110'
      os.server_name = 'vagrant-devstack-vxlan'
  end

  config.vm.provision "shell", inline: "sudo apt-get -y install git"
  config.vm.provision "shell", inline: "git clone https://github.com/openstack-dev/devstack.git"

end
