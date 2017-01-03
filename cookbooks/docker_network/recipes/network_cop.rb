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
