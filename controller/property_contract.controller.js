const Web3 = require('web3')
const PropertyABI = require('../build/Property.json')


const web3 = new Web3('HTTP://127.0.0.1:7545')

const contractAddress = "0x6e86635Cf80D3a3346aB2b22181B697e4337Ff53"
const propertyContract = new web3.eth.Contract(PropertyABI, contractAddress)


// @desp: Create Property
// @route: /contract/create
// @method: POST