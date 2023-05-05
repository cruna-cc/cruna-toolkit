# NFT-owned Smart Contracts

## Attention, this is the first draft. Changes are likely to happen. Use at your own risk. Wait for this message to be removed before using in production

## Overview
The NFTOwned protocol allows an NFT (owning token) to have control over a subordinate contract implementing the INFTOwned interface. The owning token is an ERC721 token, and the subordinate contract is designed to restrict certain actions to the owner of the owning token.

There are many attempts to allow NFTs to own smart contracts, wallets, etc. For example, the clever [ERC6551](https://eips.ethereum.org/EIPS/eip-6551) and the minimalistic [ERC3652](https://github.com/ethereum/EIPs/pull/3652) (closed due to inactivity). Both require the deploy of a new contract for any tokenId. ERC6551 also restrict the tokenId to a single owned wallet.

NFTOwned, instead, does not put any limit on the number of subordinate contracts and allows the deployment of a single smart contract bound to the NFT, which inherits the owners of the NFT. 

## The interface

``` solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

// Authors: Francesco Sullo <francesco@sullo.co>

// An owned contract has no control on its own ownership.
// Whoever owns the owning token owns the owned contract.
// ERC165 interface id is

interface INFTOwned /* is ERC165 */ {

  // Returns the address of the owning token.
  function owningToken() external view returns (address);

  // Returns the address of the owner of a specific tokenId of the owning token.
  // Notice that this protocol makes sense only for contract that implements
  // some logic using an id corresponding to a tokenId of the owning token.
  function ownerOf(uint256 tokenId) external view returns (address);
}
```

The smart contract implementing the interface should assure that the owning token is an ERC-721.

## The implementation

This repository contains the following Solidity smart contracts:

**INFTOwned.sol**: The interface for the subordinate contract.

**NFTOwned.sol**: The implementation of the INFTOwned interface, extending the ERC165 interface for supporting standard interfaces.

Plus examples to show how to use it:

**MyOwnedContract.sol**: A sample subordinate contract that extends NFTOwned. It contains a mapping of token IDs to amounts and provides methods to initialize the contract and add amounts.

**MyToken.sol**: An ERC721 contract that acts as the owning token in the protocol.

## Use Cases

The NFTOwned protocol can be used in scenarios where an ERC721 token (NFT) is required to control a related contract. Examples include:

- Controlling access to certain functions in a smart contract based on the ownership of an NFT.
- Implementing a rewards system where the owning token (NFT) controls the distribution of rewards to its owner.

## How It Works
The MyOwnedContract contract is a sample subordinate contract that extends the NFTOwned contract. It has the following functionalities:

Initialize the contract by calling the init function. This function can only be called by the owner of the corresponding owning token (NFT).

Add some amount to the contract by calling the addSomeAmount function. This function can only be called by the owner of the corresponding owning token (NFT).

The MyToken contract is an ERC721 token that acts as the owning token in this protocol. The owner of this token has control over the MyOwnedContract instances that correspond to the owned tokens.

## Getting Started
To use the MyOwnedContract protocol, follow these steps:

1. Install the dependencies
``` 
npm i -g pnpm
pnpm i 
```

The test suite deploys the MyOwnedContract and MyToken contracts, mints a few tokens, and checks the behavior of the init and addSomeAmount functions for both successful and unsuccessful calls. Launch the tests:
``` 
pnpm test
```

## Copyright

(c) 2023, Francesco Sullo <francesco@sullo.co>, Cruna 

## License

This protocol is released under the MIT License.
