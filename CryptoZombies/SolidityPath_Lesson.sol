pragma solidity >=0.5.0 <0.6.0; //always put version

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

contract ZombieFactory { 

    uint dnaDigits = 16;
    uint dnaModulus = 10 ** dnaDigits;
    
    // struct is like an obejct with multiple attributes
    struct Zombie {
        string name;
        uint dna;
    }

    Zombie[] public zombies;

    function _createZombie(string memory _name, uint _dna) private{
        zombies.push(Zombie(_name, _dna));
    }

    function _generateRandomDna(string memory _str) private view returns (uint) {

    }

}
