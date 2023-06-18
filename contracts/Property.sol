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
    mapping(address => uint256) shares;
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
  // CreateProperty
  function CreateProperty(string memory _location, uint256 _price) public onlyOwner {
    _propertyIdCounter = _propertyIdCounter + 1;
    uint256 newPropertyId = _propertyIdCounter;

    // error location
    //  LandProperty(newPropertyId, _location, _price, _shares);
    LandProperty storage newLandProperty = properties[newPropertyId];
    newLandProperty.propertyId = newPropertyId;
    newLandProperty.location = _location;
    newLandProperty.price = _price;
    newLandProperty.shares[msg.sender] = 100;

    // minting the Property
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

    _transfer(propertyOwner, msg.sender, _propertyId);
    if (msg.value > landprop.price) {
        emit UpdatePrice(_propertyId, msg.value);
        landprop.price = msg.value;
    }

    emit PropertySold(_propertyId, msg.sender, msg.value);
    emit PropertyTransfered(_propertyId, msg.sender);
  }

  // SetPropertyPrice / UpdatePropertyPrice
  function updatePropertyPrice(uint256 _propertyId, uint256 _newPrice) public onlyOwner{
      LandProperty storage landprop = properties[_propertyId];
      require(landprop.propertyId == _propertyId, "Property does not exist.");

      emit UpdatePrice(_propertyId, _newPrice);
      landprop.price = _newPrice;
  }

    // TransferOwnership 
  function TransferOwnership(address _newOwner, uint256 _propertyId) public onlyOwner {
      address currentOwner = ownerOf(_propertyId);
      require(currentOwner != _newOwner, "The new owner is already the current Owner.");

      _transfer(currentOwner, _newOwner, _propertyId);
      emit PropertyTransfered(_propertyId, _newOwner);
  }
  
  // PropertyNominee
  // function PropertyNominee() public {}
  
  // GetOwnershipPercentage
  function GetOwnerhipPercentage(uint256 _propertyId, address _owner) public view returns(uint256) {
      LandProperty storage landprop = properties[_propertyId];
      require(landprop.propertyId == _propertyId, "Property does not exists.");

      uint256 totalShares = 100;

      uint256 ownerShares = landprop.shares[_owner];
      uint256 ownershipPercentage = (ownerShares * 100) / totalShares;
      return ownershipPercentage;
  }

  // UpdateSharedOwner
  // function UpdateSharedOwner() public {}
  
  // AddSharedOwner
  function AddSharedOwner(address _sharedOwner, uint256 _shares, uint256 _propertyId) private onlyOwner { 
      LandProperty storage landprop = properties[_propertyId];
      require(landprop.propertyId == _propertyId, "Property does not exist.");

      uint256 previousShares = landprop.shares[msg.sender];

      landprop.shares[msg.sender] = previousShares - _shares;
      landprop.shares[_sharedOwner] = _shares;

      emit SharedOwnerUpdate(_propertyId, _sharedOwner, _shares);
      emit SharedOwnerUpdate(_propertyId, msg.sender, landprop.shares[msg.sender]);
  }
}
