docker_image 'hyperledger/fabric-peer' do
   tag 'latest'
   action 'pull'
end
docker_container 'peer_1' do
   repo 'hyperledger/fabric-peer'
   tag 'latest'
   env [ '"CORE_PEER_ID": "vp0"', '"CORE_PEER_ADDRESSAUTODETECT": "false"', '"CORE_NEXT": "true"', '"CORE_PEER_ADDRESS": "suryalnvs4.mylabserver.com:7051"', '"CORE_PEER_NETWORKID": "${CORE_PEER_NETWORKID}"', '"CORE_PEER_COMMITTER_ENABLED": "true"', '"CORE_PEER_COMMITTER_LEDGER_ORDERER": "suryalnvs3.mylabserver.com:5151"', '"CORE_PEER_PROFILE_ENABLED": "true"', '"CORE_PEER_DISCOVERY_PERIOD": "60s"', '"CORE_PEER_DISCOVERY_TOUCHPERIOD": "60s"', '"CORE_PEER_DISCOVERY_ROOTNODE": "suryalnvs4.mylabserver.com:7051"', '"CORE_VM_ENDPOINT": "tcp://suryalnvs4.mylabserver.com:2375"', '"CORE_LOGGING_LEVEL": "DEBUG"' ]
   port '7051:7051'
   volume ['/var/run:/host/var/run/']
   command 'peer node start'
   action :run
end
