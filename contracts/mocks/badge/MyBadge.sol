// SPDX-License-Identifier: GPL3
pragma solidity ^0.8.9;

import "../../badge/ERC721Badge.sol";

contract MyBadge is ERC721Badge {
  constructor() ERC721Badge("MY Badge", "mBDG") {}

  function safeMint(address to, uint256 tokenId) public {
    _safeMint(to, tokenId);
  }

  function getInterfacesIds() public pure returns (bytes4, bytes4) {
    return (type(IERC721DefaultApprovable).interfaceId, type(IERC6982).interfaceId);
  }
}
