all    : users test;
users   :; node blacksmith.js create
test :; forge test -vvv --contracts src/test
deps :; git submodule update --init --recursive
install :; npm install
