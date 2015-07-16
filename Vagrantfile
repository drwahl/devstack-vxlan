
Vagrant.configure("2") do |config|

 $os_username = ENV['OS_USERNAME']
 $os_password = ENV['OS_PASSWORD']
 $os_tenant_name = ENV['OS_TENANT_NAME']
 # non-standard OS variables
 $os_keypair_name = ENV['OS_KEYPAIR_NAME']
 $os_ssh_username = ENV['OS_SSH_USERNAME']

 config.ssh.private_key_path = '~/.ssh/id_rsa'
 config.vm.box = 'dummy'
 config.vm.box_url = 'https://github.com/cloudbau/vagrant-openstack-plugin/raw/master/dummy.box'

 config.vm.define "controller" do |controller|
  controller.vm.provider :openstack do |os|
   os.username = $os_username
   os.api_key = $os_password
   os.tenant = $os_tenant_name
   os.keypair_name = $os_keypair_name
   os.ssh_username = $os_ssh_username
   os.flavor = 'lightspeed'
   os.image = 'Ubuntu-14.04-Trusty'
   os.endpoint = 'https://keystone.dream.io/v2.0/tokens'
   os.network = 'private-network'
   os.hostname = 'devstack-vxlan'
   os.floating_ip = :auto
   os.floating_ip_pool = 'public-110'
   os.server_name = 'vagrant-devstack-vxlan-controller'
  end

  controller.vm.provision "shell", path: "controller_setup.sh"
  controller.vm.provision "shell", path: "controller_vxfld.sh"
  controller.vm.provision "shell", inline: "chown -R " + $os_ssh_username + ":" + $os_ssh_username + " /opt/stack"

 end

 config.vm.define "compute" do |compute|
  compute.vm.provider :openstack do |os|
   os.username = $os_username
   os.api_key = $os_password
   os.tenant = $os_tenant_name
   os.keypair_name = $os_keypair_name
   os.ssh_username = $os_ssh_username
   os.flavor = 'lightspeed'
   os.image = 'Ubuntu-14.04-Trusty'
   os.endpoint = 'https://keystone.dream.io/v2.0/tokens'
   os.network = 'private-network'
   os.hostname = 'devstack-vxlan'
   os.floating_ip = :auto
   os.floating_ip_pool = 'public-110'
   os.server_name = 'vagrant-devstack-vxlan-compute'
  end

  compute.vm.provision "shell", path: "compute_setup.sh"
  compute.vm.provision "shell", path: "compute_vxfld.sh"
  compute.vm.provision "shell", inline: "chown -R " + $os_ssh_username + ":" + $os_ssh_username + " /opt/stack"

 end

end
