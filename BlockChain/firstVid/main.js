const SHA256 = require('crypto-js/sha256');

class Block {
	constructor(index, timestamp, data, previousHash = '') {
		this.index = index;
		this.timestamp = timestamp;
		this.data = data;
		this.previousHash = previousHash;
		this.hash = this.calculateHash();
	}

	calculateHash() {
		return SHA256(this.index + this.previousHash + this.timestamp + JSON.stringify(this.data)).toString();
	}
}

class Chain {
	constructor() {
		this.chain = [this.createGenesisBlock];
	}
	
	createGenesisBlock() {
		return new Block(0, '01/01/2021', 'Genesis Block', '0');
	}
	
	getLatestBlock() {
		return this.chain[this.chain.length - 1];
	}
	
	addBlock(newBlock) {
		newBlock.previousHash = this.getLatestBlock().hash;
		newBlock.hash = newBlock.calculateHash();
		this.chain.push(newBlock);
	}
	
	isChainValid() {
		for (let i = 1; i < this.chain.length; i++) {
			const currentBlock = this.chain[i];
			const previousBlock = this.chain[i - 1];
			
			if (currentBlock.hash !== currentBlock.calculateHash()) {
				return false;
			}
			
			if (currentBlock.previousHash !== previousBlock.hash) {
				return false;
			}
		}
		
		return true;
	}
}

let dixcoin = new Chain();

dixcoin.addBlock(new Block(1, '10/07/2021', { amount: 4 }));
dixcoin.addBlock(new Block(2, '10/08/2021', { amount: 7 }));

console.log('chain validity: ' + dixcoin.isChainValid());
console.log(JSON.stringify(dixcoin, null, 4));

//tamper 1
dixcoin.chain[1].data = { amount : 100 };
console.log('chain validity: ' + dixcoin.isChainValid());
console.log(JSON.stringify(dixcoin, null, 4));

//tamper 2
dixcoin.chain[1].data = { amount : 100 };
dixcoin.chain[1].hash = dixcoin.chain[1].calculateHash();
console.log('chain validity: ' + dixcoin.isChainValid());
console.log(JSON.stringify(dixcoin, null, 4));

//tamper 3
dixcoin.chain[1].data = { amount : 100 };
dixcoin.chain[1].hash = dixcoin.chain[1].calculateHash();
dixcoin.chain[2].previousHash = dixcoin.chain[1].calculateHash();
console.log('chain validity: ' + dixcoin.isChainValid());
console.log(JSON.stringify(dixcoin, null, 4));