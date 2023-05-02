// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Property is ERC721, Ownable {

  constructor() ERC721("LandOwnership", "LRS"){}

  struct LandProperty {
    uint256 propertyId;
    string location;
    uint256 price;
    // mapping(address => uint256) shares;
  }

//   LandProperty public landPropertyInstance;
  
  // token Id counter
  uint256 private _propertyIdCounter;

  // properties owned
  mapping(uint256 => LandProperty) public properties;

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
  event SharedOwnerUpdate(
    uint256 indexed propertyId, 
    address indexed owner, 
    uint256 shares
  );

  // TODO:
  // SetPropertyPrice / UpdatePropertyPrice
  function SetProperty() public {

  }
  
  // TransferOwnership 
  function TransferOwnership() public {}
  
  // CreateProperty
  function CreateProperty(string memory _location, uint256 _price) public onlyOwner {
    _propertyIdCounter = _propertyIdCounter + 1;
    uint256 newPropertyId = _propertyIdCounter;

    properties[newPropertyId] = LandProperty(newPropertyId, _location, _price);
    _mint(msg.sender, newPropertyId);
    
    emit PropertyCreated(newPropertyId, _location, _price);
    emit SharedOwnerUpdate(newPropertyId, msg.sender, 100);
  }
  
  // BuyProperty
  function BuyProperty(uint256 _propertyId) public payable {
    LandProperty storage landprop = properties[_propertyId];
    require(landprop.propertyId == _propertyId, "Property does not exist.");
    require(msg.value == landprop.price, "Insufficient funds to buy the property.");  

    address propertyOwner = ownerOf(_propertyId);
    require(propertyOwner != msg.sender, "You already own this property.");
  }

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
