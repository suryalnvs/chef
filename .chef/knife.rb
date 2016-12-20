# See https://docs.getchef.com/config_rb_knife.html for more information on knife configuration options

current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "surya"
client_key               "#{current_dir}/surya.pem"
chef_server_url          "https://suryalnvs2.mylabserver.com/organizations/itpeople"
cookbook_path            ["#{current_dir}/../cookbooks"]
