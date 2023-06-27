const express = require('express')
const { 
    getBalance, 
    getAccounts, 
    getBalanceByAddress 
} = require('../controller/account.controller')
const accnRouter = express.Router()


accnRouter.get("/balance", getBalance)
accnRouter.get("/accounts", getAccounts)
accnRouter.get("/v1/:account", getBalanceByAddress)


module.exports = accnRouter