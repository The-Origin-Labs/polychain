const { Web3 } = require('web3')
const PropertyABI = require('../build/Property.json')
const truffleContract = require('@truffle/contract')


const PROVIDER_URL = 'http://127.0.0.1:7545'
// const web3 = new Web3(PROVIDER_URL) 
const provider = new Web3.providers.HttpProvider(PROVIDER_URL)
const web3 = new Web3(provider)

const contractAddress = "0xd5cfE46F09C56d90bd7E670cAfAD40FCA6A2932c"
const propertyContract = new web3.eth.Contract(PropertyABI.abi, contractAddress)

const TrufflePropertyContract = truffleContract({
    abi: PropertyABI.abi,
    address: contractAddress
});

// TrufflePropertyContract.setProvider(provider)

// TrufflePropertyContract.setProvider(provider)



// @desp: Create Property
// @route: /contract/create
// @method: POST
const CreatePropertyTransaction = async (req, res) => {
    try {
        const { location, price } = req.body

        // get current Ethereum Account
        let accounts = await web3.eth.getAccounts()
        
        const sender = accounts[0]
        // web3.eth.getBalance(sender).then(res => console.log("💵 Balance:", res))
   
        // send transaction to smart contract
        const result = await propertyContract.methods.CreateProperty(location, price).send({ from: sender, gas: '2000000' })
        
        const transactionCost = web3.utils.fromWei(result.gasUsed, 'ether')
        const blockNumber = web3.utils.toNumber(result.blockNumber)
        const cumlativeGasUsed = web3.utils.fromWei(result.cumulativeGasUsed, "ether")

        console.log(result.logs)

        res.status(201).json({
            transactionHash: result.transactionHash,
            blockHash: result.blockHash,
            blockNumber: blockNumber,
            cumlativeGasUsed: cumlativeGasUsed,
            transactionCost: transactionCost,
            from: result.from,
            to: result.to,
        })
    
    }catch(err) {
        console.error('Error creating property', err)
        res.status(500).json({
            error: "Failded to create property."
        })
    }
}




module.exports = {
    CreatePropertyTransaction,
}