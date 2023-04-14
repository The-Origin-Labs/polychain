// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Property is ERC721, Ownable {

  constructor() ERC721("LandOwnership", "LRS"){}

  struct LandProperty{
    uint256 tokenId;
    string location;
    uint256 price;
  }

  // properties owned
  mapping(uint256 => Property) public properties;

  // Events:
  // PropertyCreated
  event PropertyCreated(
    uint256 indexed propertyId, 
    string location, 
    uint256 price
  );

  // PropertyTransfered
  event PropertyTransfered(
    uint256 indexed propertyId, 
    address indexed buyer
  );
  
  // PropertySold
  event PropertySold(
    uint256 indexed propertyId, 
    address indexed buyer, 
    uint256 price
  );
  
  // PropertyUpdatedPrice
  event UpdatePrice(
    uint256 indexed propertyId, 
    uint256 new_price
  );
  
  // Nominated
  event Nominated(
    uint256 indexed propertyId, 
    address indexed nominee
  );

  // SharedOwnerAdded
  event SharedOwnerAdded(
    uint256 indexed propertyId, 
    address indexed owner, 
    uint256 percentageOwnership
  );

  // TODO:  
  // SetPropertyPrice / UpdatePropertyPrice
  function SetProperty() public {}
  
  // TransferOwnership 
  function TransferOwnership() public {}
  
  // CreateProperty
  function CreateProperty() public {}
  
  // BuyProperty
  function BuyProperty() public {}

  // PropertyAvailability
  function PropertyAvailability() public {}
  
  // PropertyNominee
  function PropertyNominee() public {}

  // SharedOwnerShip, the visibility can be private as 
  // sometimes shared ownership
  function SharedOwnerShip() public {}
  
  // GetOwnershipPercentage
  function GetOwnerhipPercentage() public {}

  // UpdateSharedOwner
  function UpdateSharedOwner() public {}
  
  // AddSharedOwner
  function AddSharedOwner() private {}

  // FractionalOwnership
  function FractionOwnership() private {}

}
