docker_image 'lhaskins/fabric-peer' do
   tag 'latest'
   action 'pull'
end
docker_container 'peer_1' do
   repo 'lhaskins/fabric-peer'
   tag 'latest'
   env [ '"CORE_PEER_ID": "vp0"', '"CORE_PEER_ADDRESSAUTODETECT": "false"', '"CORE_NEXT": "true"', '"CORE_PEER_ADDRESS": "54.202.243.113:7051"', '"CORE_PEER_NETWORKID": "${CORE_PEER_NETWORKID}"', '"CORE_PEER_COMMITTER_ENABLED": "true"', '"CORE_PEER_COMMITTER_LEDGER_ORDERER": "54.213.200.41:5151"', '"CORE_PEER_PROFILE_ENABLED": "true"', '"CORE_PEER_DISCOVERY_PERIOD": "60s"', '"CORE_PEER_DISCOVERY_TOUCHPERIOD": "60s"', '"CORE_PEER_DISCOVERY_ROOTNODE": "54.202.243.113:7051"', '"CORE_VM_ENDPOINT": "tcp://54.202.243.113:2375"', '"CORE_LOGGING_LEVEL": "DEBUG"' ]
   port '7051:7051'
   volume ['/var/run:/host/var/run/']
   command 'peer node start'
   action :run
end
