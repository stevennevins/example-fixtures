all    :  users test;
grab:; curl -O https://raw.githubusercontent.com/stevennevins/blacksmith/main/blacksmith.js
users   : grab; node blacksmith.js create
test :; forge test -vvv
