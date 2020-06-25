# Clean folder with other channel configurations

rm -rf channel-artifacts

mkdir channel-artifacts


# Re-generate crypto-config because we need new crypto material for the new orderers -> add 4 orderers

../../fabric-samples/bin/cryptogen generate --config=./crypto-config-raft.yaml


# Re-generate inicial channel config

export FABRIC_CFG_PATH=$PWD

../../fabric-samples/bin/configtxgen -profile SampleMultiNodeEtcdRaft -channelID raft-sys-channel -outputBlock ./channel-artifacts/genesis.block

export CHANNEL_NAME=allchannel  && ../../fabric-samples/bin/configtxgen -profile AllCompaniesChannel -outputCreateChannelTx ./channel-artifacts/channel.tx -channelID $CHANNEL_NAME

docker-compose -f docker-compose-raft.yaml up -d

