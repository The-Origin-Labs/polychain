const express = require('express');
const morgan  = require('morgan');
const cors = require('cors');
const contractRoutes = require('./routes/contract.routes');
const accnRouter = require('./routes/account.routes');
require('dotenv').config()

const app = express()
const PORT = process.env.PORT || 8009

app.use(cors())
app.use(express.json())
app.use(morgan('dev'))

app.get("/", (req, res) => {
    res.status(200).json({
        "message":"Welcome to Polychain API.",
    })
})

app.use("/contract", contractRoutes)
app.use("/account", accnRouter)

app.listen(PORT, () => {
    console.log(`Server running at http://localhost:${PORT}`)
})