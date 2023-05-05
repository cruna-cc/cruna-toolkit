# Dominant-Subordinate Protocol

### This was previously in @ndujaLabs/ERC721Subordinate

A simple badge model for soulbound tokens and badges.



## The interfaces

### IERC721DefaultApprovable

```solidity
// SPDX-License-Identifier: GPL3
pragma solidity ^0.8.17;

// Author: Francesco Sullo <francesco@sullo.co>

// erc165 interfaceId 0xbfdf8f79
interface IERC721DefaultApprovable {
  // Must be emitted when the contract is deployed.
  event DefaultApprovable(bool approvable);

  // Must be emitted any time the status changes.
  event Approvable(uint256 indexed tokenId, bool approvable);

  // Returns true if the token is approvable.
  // It should revert if the token does not exist.
  function approvable(uint256 tokenId) external view returns (bool);

  // A contract implementing this interface should not allow
  // the approval for all. So, any actor validating this interface
  // should assume that the tokens are not approvable for all.

  // An extension of this interface may include info about the
  // approval for all, but it should be considered as a separate
  // feature, not as a replacement of this interface.
}
```

### IERC6982

```solidity
// SPDX-License-Identifier: CC0-1.0
pragma solidity ^0.8.0;

// erc165 interfaceId 0xb45a3c0e
interface IERC6982 {
  // Must be emitted one time, when the contract is deployed,
  // defining the default status of any token that will be minted
  event DefaultLocked(bool locked);

  // Must be emitted any time the status changes
  event Locked(uint256 indexed tokenId, bool locked);

  // Returns the status of the token.
  // It should revert if the token does not exist.
  function locked(uint256 tokenId) external view returns (bool);
}
```

### ERC721Badge

It implements the IERC721DefaultApprovable and the IERC6982 interfaces.

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

import "./IERC721DefaultApprovable.sol";
import "./IERC721DefaultLocked.sol";

contract ERC721Badge is IERC6982, IERC721DefaultApprovable, ERC721{
  constructor(string memory name, string memory symbol) ERC721(name, symbol) {
    emit DefaultApprovable(false);
    emit DefaultLocked(true);
  }

  function supportsInterface(bytes4 interfaceId) public view virtual override returns (bool) {
    return
    interfaceId == type(IERC721DefaultApprovable).interfaceId ||
    interfaceId == type(IERC6982).interfaceId ||
    super.supportsInterface(interfaceId);
  }

  function approvable(uint256) external view returns (bool) {
    return false;
  }

  function locked(uint256) external view returns (bool) {
    return true;
  }

  function approve(address, uint256) public virtual override {
    revert("approvals not allowed");
  }

  function getApproved(uint256) public view virtual override returns (address) {
    return address(0);
  }

  function setApprovalForAll(address, bool) public virtual override {
    revert("approvals not allowed");
  }


  function isApprovedForAll(address, address) public view virtual override returns (bool) {
    return false;
  }

  function transferFrom(
    address,
    address,
    uint256
  ) public virtual override {
    revert("transfers not allowed");
  }

  function safeTransferFrom(
    address,
    address,
    uint256,
    bytes memory
  ) public virtual override {
    revert("transfers not allowed");
  }
}
```

## How to use it

Install the dependencies like
``` 
npm i @cruna/toolkit
```


