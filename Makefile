all    : users test;
# dapp deps
dapp: dapp_solc dapp_update; rm -rf src/test
dapp_update:; dapp update
SOLC_VERSION := 0_8_11
dapp_solc:; nix-env -f https://github.com/dapphub/dapptools/archive/master.tar.gz -iA solc-static-versions.solc_${SOLC_VERSION}
# Build & test
dapp_build  :; dapp build
users   :; node blacksmith.js create
build :; dapp build
test :; forge test -vvv --contracts src/test
deps :; git submodule update --init --recursive
install :; npm install
prettier :; npm run prettier
