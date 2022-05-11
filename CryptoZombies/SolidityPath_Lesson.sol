/* A contract for hello world
contract HelloWorld {

}
*/

/*
variables

uint -- must be non-negative
int -- can be negative
string -- words
uint[2] -- fixed array
uint[] -- dynamic array
Person[] public people -- array of structs that is public
*/

/*
function eatHamburgers(string memory _name, uint _amount) public {

}
*/

//it's convention to start private function names with an underscore (_)

/*
Returning values in a function
string greeting = "What's up dog";

function sayHello() public returns (string memory) {
  return greeting;
}

view -- returns a value within the app
pure -- returns a value based from parameters
*/

/* declare the event
event IntegersAdded(uint x, uint y, uint result);

function add(uint _x, uint _y) public returns (uint) {
  uint result = _x + _y;
  // fire an event to let the app know the function was called:
  emit IntegersAdded(_x, _y, result);
  return result;
}
*/

pragma solidity >=0.5.0 <0.6.0; //always put version

contract ZombieFactory {

    event NewZombie(uint zombieId, string name, uint dna);

    uint dnaDigits = 16;
    uint dnaModulus = 10 ** dnaDigits;

    struct Zombie {
        string name;
        uint dna;
    }

    Zombie[] public zombies;

    function _createZombie(string memory _name, uint _dna) private {
        uint id = zombies.push(Zombie(_name, _dna)) - 1;
        emit NewZombie(id, _name, _dna);
    }

    function _generateRandomDna(string memory _str) private view returns (uint) {
        uint rand = uint(keccak256(abi.encodePacked(_str)));
        return rand % dnaModulus;
    }

    function createRandomZombie(string memory _name) public {
        uint randDna = _generateRandomDna(_name);
        _createZombie(_name, randDna);
    }

}

