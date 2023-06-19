const express = require('express');
const router = express.Router()
const {
    CreatePropertyTransaction
} = require('../controller/property_contract.controller')

router.get("/", (req, res) => {
    res.status(200).json({
        "message": "smart-contract routes",
        "url": "/contract",
    })
})

router.post("/create", CreatePropertyTransaction)

module.exports = router;



