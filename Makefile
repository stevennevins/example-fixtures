all    : users test;
users   :; node blacksmith.js create
dapp_update :; dapp update
dapp_build :; dapp build
build :; forge build
test :; forge test -vvv --contracts src/test
deps :; git submodule update --init --recursive
install :; npm install
prettier :; npm run prettier
