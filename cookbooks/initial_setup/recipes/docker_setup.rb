if node['platform_family'] == "debian"
   package ['apt-transport-https', 'ca-certificates'] do
   end
   apt_update 'Update the apt cache' do
    action :update
   end
   apt_repository 'docker' do
    uri 'https://apt.dockerproject.org/repo'
    keyserver 'hkp://ha.pool.sks-keyservers.net:80'
    key '58118E89F3A912897C070ADBF76221572C52609D'
   end
   file '/etc/apt/sources.list.d/docker.list' do
    content 'deb https://apt.dockerproject.org/repo ubuntu-trusty main'
   end
   apt_update 'Update the apt cache daily' do
    action :update
   end
   package ["linux-image-extra-#{node['kernel']['release']}", 'linux-image-extra-virtual'] do
   end
   package ['docker-engine'] do 
   end
   file '/etc/default/docker' do
    content 'DOCKER_OPTS="-s=aufs -r=true --api-cors-header=\'*\' -H tcp://0.0.0.0:2375 -H unix:///var/run/docker.sock "'
   end
   service "docker" do
    action :restart
   end
end 

   
