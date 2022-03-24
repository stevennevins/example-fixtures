all    : users test;
# dapp deps
dapp: solc update;
dapp_update:; dapp update
SOLC_VERSION := 0_8_11
solc:; nix-env -f https://github.com/dapphub/dapptools/archive/master.tar.gz -iA solc-static-versions.solc_${SOLC_VERSION}
# Build & test
dapp_build  :; dapp build
users   :; node blacksmith.js create
build :; dapp build
test :; forge test -vvv --contracts src/test
deps :; git submodule update --init --recursive
install :; npm install
prettier :; npm run prettier
