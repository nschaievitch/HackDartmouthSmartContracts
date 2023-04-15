# Introduction to Blockchain and Smart Contracts

## Introduction

This presentation is meant to give a short introduction to blockchain and smart-contracts, and get you writing your first lines of Solidity code. I only assume basic programming skills for the Solidity part.

## What is a Blockchain?

The simplest way to understand a blockchain is as a public database (i.e. a collection of data) where everyone can write and read in, but nobody can modify or erase its historical record.

The most common use case is to use this to record economic transactions between people. For example, if I know Alice and Bob have 100 coins each, and a transaction of "*Alice gives Bob 5 coins*" is added, I know that now Alice has 95 coins and Bob 105.

## How does it work?

If this database was stored in a single computer, the person who controls that computer could just mess with the blockchain at their own will. So the way it works is that a lot of people's computers (called *nodes*) each hold a copy of this database, and something called a *consensus algorithm* is used to agree on a single true state of the information. Meaning, **everyone agrees on what the blockchain says**.

The information is grouped in **blocks** that form a **chain**, with each new block pointing to the one right before it.

## Identity

If you start thinking about this mechanism, you quickly find two problems:
1. You can't just say "Alice" and "Bob", first names are not great identifiers. You need a system of *IDs* to know who you're sending money to.
2. If everyone can just write to the blockchain, what if I just say Alice sent me all of her money? How do you verify who says what?

The solution is something called a *signature scheme*. It's a *cryptographic primitive* (meaning a tool from cryptography used to build other things). The way it works is as follows: each person has a *public* and a *private* key. The **public key** works sort of as a name, usually called an **address**, which identifies an account (note: just to be pedantic, the address is not exactly the public key, but it's generated from it). The **private key** is similar to a password, and it controls access to the account. What the scheme allows us to do is to *sign* the message with our private key, and anyone that has our public key can verify that it was us who signed.

## Wallets

In order to manage the private and public keys, programs called *wallets* store these values and allow you to have a nice interface to interact with the blockchain. The most famous example is Metamask, which is a free and open-source wallet that works as a browser extension or mobile app.

An important distinction to take into account is that most people call things like Binance or Coinbase wallets. This is wrong. In these websites, your private key is actually controlled by the company, so they actually have the wallet corresponding to your account.

## Some history

Let's take a step back and talk about how blockchains were invented by a person or group of people under the pseudonym Satoshi Nakamoto in 2008 for Bitcoin. Nobody really knows who they were. Thousands of blockchains were created after this, with a lot of diverse and often insane claims. After Bitcoin, the most important blockchain is Ethereum which was conceived originally by Vitalik Buterin in 2013.

## What is different about Ethereum?

The main difference between Ethereum and Bitcoin is the introduction of **Smart Contracts**. These are programs that run on the blockchain, and all nodes run it to verify the output. In this way, you don't need to trust the person who runs it, as there is consensus among a large group of people. For example, let's say you want to run an art competition. You can make a smart contract where each participant can submit their entry, and then chooses the winner based on the votes of a group of judges. This contract can make sure all submissions were posted on time, and that there is transparency in the votes of the judges.

## About gas

As code execution takes time, there is a measure of the cost of execution every time the contract is used. In Ethereum, this is called **gas**, and it works as an incentive for the nodes to run the code. In general, the more complicated the code is, the more gas it takes.

## Solidity

These smart contracts are written in a similar way to traditional code. The most popular programming language used for this purpose, and which can be used for Ethereum, is **Solidity**. Solidity looks somewhat similar to Javascript, but is designed specifically for this use case.

One way to think about smart contracts (although most Solidity engineers would dislike it) is that it looks similar to a traditional server-side program. It has different actions that can be performed by its user, and logic related to each one. 

## A taste of Solidity

Let's look at a very simple Hello World:

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract MyContract {
    function helloWorld() public view returns (string memory) {
        return "Hello, World!";
    }
}
```

The first two lines are just defining the license and Solidity version, which we don't care about for now. Copying and pasting them is fine. Next, we have our actual contract, which in this case is called `MyContract`. Note that if you're familiar with object-oriented programming, a contract is fairly similar to a class. We then have a single action that can be performed by the user, which is the `helloWorld` function. `public` means anyone can run it, and `view` means it doesn't change anything. It then says that it returns a `string`, aka text, which is the line `return "Hello, World!";`. Note the semicolon!

Let's make it a bit more interesting, and allow the message to be changed.
```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract MyContract {
	string private message = "Hello, World!";
	
	function setMessage (string memory _message) public {
		message = _message;
	}
	
	function helloWorld() public view returns (string memory) {
		return message;
	}
}
```

We now have a variable `message`, that can be changed with the `setMessage` function.

## Testing our contract

Let's try actually running our code. We're going to use [Remix](https://remix.ethereum.org), an in-browser editor, to make our lives a lot easier by avoiding configuration. Let's create a file in the "contracts" folder called `MyContract.sol`, and paste our code. Let's compile the contract with the green arrow, and select the Deploy section in the sidebar to actually test it. We now have an instance of the contract running on our local machine, and we can try interacting with it.

## Deploying the contract

Before we can actually deploy our contract to the real world, we might want to have a better simulation where we can do better tests of our code. There are "fake blockchains," with fake money, called **testnets**. These allow you to deploy and test your code in a stress-free and risk-free environment.

We are going to use a testnet called *Sepolia*. To get funds (which we need in order to pay for gas) we use a **faucet**, a website which gives free funds in testnets (not worth real money! never pay for testnet funds). You can find some faucets [here](https://faucetlink.to/sepolia).

We'll need to use a wallet in order to interact with the testnet. I recommend setting up Metamask **with a test account** for this purpose. It's better to start with an account you don't care about, to avoid any possible costly mistakes. Make sure you change your network to Sepolia (select network, show testnets, Sepolia).

We can now select "injected provider" in Remix to deploy to the testnet. We can check that it deployed correctly by using a **blockchain explorer**, which is just a website that allows you to list and search the transactions for a blockchain. You can find a Sepolia explorer [here](https://sepolia.etherscan.io/). Look for the address, and you should be able to see your contract live!

## Next steps

There are plenty of resources for learning more about smart contracts and solidity. Here are a couple of cool ones:
- [The official Ethereum website](https://ethereum.org/en/): It has a lot of really good articles and guides for all things Ethereum.
- [Solidity by Example](https://solidity-by-example.org/): Lots of example codes for all levels of Solidity.
- [Crypto Zombies](https://cryptozombies.io/): A game-like course for learning Solidity from scratch.
- [Ethernaut](https://ethernaut.openzeppelin.com/): This is also a game-like course which gets to a more advanced level. It consists of a series of contracts you need to hack, and is great for getting into security.
