# Ensure 'git' already installed
> apt-get update -y && apt-get install git -y
# Auto install
> wget https://raw.githubusercontent.com/deptraikhoaito2024/Warden_deptraikhoaito/deptraikhoaito/auto_install.sh && chmod +x auto_install.sh && ./auto_install.sh
# create a new wallet
> wardend keys add $WALLET

# restore exexuting wallet
> wardend keys add $WALLET --recover

# check sync status
> wardend status 2>&1 | jq 

# check balance
> wardend query bank balances $WALLET_ADDRESS 


# Create validator.json file

> echo "{\"pubkey\":{\"@type\":\"/cosmos.crypto.ed25519.PubKey\",\"key\":\"$(wardend comet show-validator | grep -Po '\"key\":\s*\"\K[^"]*')\"},
    \"amount\": \"1000000uward\",
    \"moniker\": \"your_node_name\",
    \"identity\": \"\",
    \"website\": \"\",
    \"security\": \"\",
    \"details\": \"\",
    \"commission-rate\": \"0.1\",
    \"commission-max-rate\": \"0.2\",
    \"commission-max-change-rate\": \"0.01\",
    \"min-self-delegation\": \"1\"
}" > validator.json

# Create a validator using the JSON configuration
> wardend tx staking create-validator validator.json \
    --from $WALLET \
    --chain-id buenavista-1 \
	--gas auto --gas-adjustment 1.5 --fees 600uward \

