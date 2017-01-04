docker_image 'lhaskins/fabric-cop' do
   tag 'latest'
   action :pull
end

docker_image 'lhaskins/fabric-orderer' do
   tag 'latest'
   action :pull
end

docker_container 'cop1' do
   repo 'lhaskins/fabric-cop'
   tag 'latest'
   command 'sh -c "cop server start -ca ~/.cop/ec.pem -ca-key ~/.cop/ec-key.pem -config /config/cop.json -address 0.0.0.0"'
   port '8888:8888'
   not_if "[ ! -z `docker ps -qaf 'name=cop1'` ]"
   action :run
end

docker_container 'orderer1' do
   repo 'lhaskins/fabric-orderer'
   tag 'latest'
   command 'orderer'
   env [ '"ORDERER_GENERAL_LEDGERTYPE": "ram"', '"ORDERER_GENERAL_BATCHTIMEOUT": "10s"', '"ORDERER_GENERAL_BATCHSIZE": "10"', '"ORDERER_GENERAL_MAXWINDOWSIZE": "1000"', '"ORDERER_GENERAL_ORDERERTYPE": "solo"', '"ORDERER_GENERAL_LISTENADDRESS": "0.0.0.0"', '"ORDERER_RAMLEDGER_HISTORY_SIZE": "100"' ]
   port '5151:7050'
   not_if "[ ! -z `docker ps -qaf 'name=orderer1'` ]"
   action :run
end

#docker_image 'lhaskins/fabric-peer' do
#   tag 'latest'
#   action 'pull'
#end
#docker_container 'peer1' do
#   repo 'lhaskins/fabric-peer'
#   tag 'latest'
#   env [ '"CORE_PEER_ID": "vp0"', '"CORE_PEER_ADDRESSAUTODETECT": "false"', '"CORE_NEXT": "true"', '"CORE_PEER_ADDRESS": ":7051"', '"CORE_PEER_NETWORKID": "${CORE_PEER_NETWORKID}"', '"CORE_PEER_COMMITTER_ENABLED": "true"', '"CORE_PEER_COMMITTER_LEDGER_ORDERER": "54.202.176.39:5151"', '"CORE_PEER_PROFILE_ENABLED": "true"', '"CORE_PEER_DISCOVERY_PERIOD": "60s"', '"CORE_PEER_DISCOVERY_TOUCHPERIOD": "60s"', '"CORE_PEER_DISCOVERY_ROOTNODE": "54.202.179.211:7051"', '"CORE_VM_ENDPOINT": "tcp://54.202.179.211:2375"', '"CORE_LOGGING_LEVEL": "DEBUG"' ]
#   port '7051:7051'
#   volume ['/var/run:/host/var/run/']
#   command 'peer node start'
#   action :run
#end

