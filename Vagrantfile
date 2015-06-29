
Vagrant.configure("2") do |config|

 $os_username = ENV['OS_USERNAME']
 $os_password = ENV['OS_PASSWORD']
 $os_tenant_name = ENV['OS_TENANT_NAME']
 # OS_KEYPAIR_NAME is a non-standard OS variable
 $os_keypair_name = ENV['OS_KEYPAIR_NAME']

 config.ssh.private_key_path = '~/.ssh/id_rsa'
 config.vm.box = 'dummy'
 config.vm.box_url = 'https://github.com/cloudbau/vagrant-openstack-plugin/raw/master/dummy.box'

 config.vm.provider :openstack do |os|
      os.username = $os_username
      os.api_key = $os_password
      os.tenant = $os_tenant_name
      os.keypair_name = $os_keypair_name
      os.flavor = 'lightspeed'
      os.image = 'Ubuntu-14.04-Trusty'
      os.endpoint = 'https://keystone.dream.io/v2.0/tokens'
      os.ssh_username = 'dhc-user'
      os.network = 'private-network'
      os.hostname = 'devstack-vxlan'
      os.floating_ip = :auto
      os.floating_ip_pool = 'public-110'
      os.server_name = 'vagrant-devstack-vxlan'
  end

  config.vm.provision "shell", inline: "sudo apt-get -y install git"
  config.vm.provision "shell", inline: "git clone https://github.com/openstack-dev/devstack.git"

end
