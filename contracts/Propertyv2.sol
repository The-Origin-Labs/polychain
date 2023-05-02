// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract PropertyV2 is ERC721, Ownable {
    using SafeMath for uint256;

    struct Property {
        uint256 id;
        string location;
        uint256 price;
    }

    uint256 private _propertyIdCounter;
    mapping(uint256 => Property) public properties;

    event PropertyCreated(uint256 indexed propertyId, string location, uint256 price);
    event PropertySold(uint256 indexed propertyId, address indexed buyer, uint256 price);

    constructor() ERC721("PropertyV2", "LPR") {}

    function createProperty(string memory _location, uint256 _price) public onlyOwner {
        _propertyIdCounter = _propertyIdCounter.add(1);
        uint256 newPropertyId = _propertyIdCounter;

        properties[newPropertyId] = Property(newPropertyId, _location, _price);
        _mint(msg.sender, newPropertyId);

        emit PropertyCreated(newPropertyId, _location, _price);
    }

    function buyProperty(uint256 _propertyId) public payable {
        Property storage property = properties[_propertyId];
        require(property.id == _propertyId, "Property does not exist");
        require(msg.value >= property.price, "Insufficient funds to buy the property");

        address propertyOwner = ownerOf(_propertyId);
        require(propertyOwner != msg.sender, "You already own this property");

        _transfer(propertyOwner, msg.sender, _propertyId);
        payable(propertyOwner).transfer(property.price);

        emit PropertySold(_propertyId, msg.sender, property.price);
    }

    function setPropertyPrice(uint256 _propertyId, uint256 _newPrice) public {
        require(ownerOf(_propertyId) == msg.sender, "You are not the owner of this property");
        properties[_propertyId].price = _newPrice;
    }
}