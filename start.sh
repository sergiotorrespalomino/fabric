# Clean folder with other channel configurations

rm -rf channel-artifacts

mkdir channel-artifacts


# Re-generate crypto-config because we need new crypto material for the new orderers -> add 4 orderers

../bin/cryptogen generate --config=./crypto-config.yaml


# Re-generate inicial channel config

export FABRIC_CFG_PATH=$PWD

../bin/configtxgen -profile consorcioOrdererGenesis -channelID all-channel -outputBlock ./channel-artifacts/genesis.block

export CHANNEL_NAME=allchannel  && ../bin/configtxgen -profile AllCompaniesChannel -outputCreateChannelTx ./channel-artifacts/channel.tx -channelID $CHANNEL_NAME

docker-compose -f docker-compose.yaml up -d

