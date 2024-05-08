curl -XPOST -d '{"address": "'$(wardend keys show wallet -a)'"}' https://faucet.buenavista.wardenprotocol.org/
sleep 30s
wardend tx staking delegate $(wardend keys show wallet --bech val -a) $(wardend q bank balances $(wardend keys show wallet -a) | grep -A1 "amount" | awk -F'"' '/amount/ {val=$2-1000000; printf "%.0f", val}')uward --from wallet --chain-id buenavista-1 --gas auto --gas-adjustment 1.5 --fees 650uward -y
