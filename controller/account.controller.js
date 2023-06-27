const { Web3 } = require('web3')
require('dotenv').config()

const PROVIDER_URL = process.env.PROVIDER_URL
const provider = new Web3.providers.HttpProvider(PROVIDER_URL)
const web3 = new Web3(provider)

// @desp: Get Account Balance
// @route: /account/balance
// @method: GET
const getBalance = async (req, res) => {      
    let accounts = await web3.eth.getAccounts()
    let account = accounts[0]
    let currentbalance = await web3.eth.getBalance(account)
    let balance = web3.utils.fromWei(currentbalance, "ether")
    res.status(200).json({
        "account": account,
        "balance": balance
    })
}

// @desp: Get all accounts
// @route: /account/accounts
// @method: GET
const getAccounts = async (req, res) => {
    let accounts = await web3.eth.getAccounts()
    res.status(200).json({
        accounts: accounts
    })
}

// @desp: Get Account Balance By Account Address
// @route: /account/v1/:account
// @method: GET
const getBalanceByAddress = async (req, res) => {
    const account = req.params.account
    let currentBalance = await web3.eth.getBalance(account)
    let balance = web3.utils.fromWei(currentBalance, "ether")
    res.status(200).json({
        "account": account,
        "balance": balance
    })
}

const Transfer = async (req, res) => {}

module.exports = {
    getBalance,
    getAccounts,
    getBalanceByAddress
}