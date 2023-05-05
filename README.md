# Cruna toolkit

This is a collection of tools for Cruna that can be used separately in any project you like.

## Attention, this is the first draft. Changes are likely to happen. Use at your own risk. Wait for this message to be removed before using in production

## Getting Started

To play with it

1. Install the dependencies
``` 
npm i -g pnpm
pnpm i 
```

Launch the tests:
``` 
pnpm test
```

## The tools

[ERC721Badge](./ERC721_BADGE.md)

[NFTOwned](./NFT_OWNED.md)

[Dominant Subordinate protocol](./DOMINANT_SUBORDINATE.md)

The NFTOwned protocol allows an NFT (owning token) to have control over a subordinate contract implementing the INFTOwned interface. The owning token is an ERC721 token, and the subordinate contract is designed to restrict certain actions to the owner of the owning token.

## Copyright

(c) 2023, Francesco Sullo <francesco@sullo.co>, Cruna 

## License

This protocol is released under the MIT License.
