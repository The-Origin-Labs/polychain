const express = require('express');
const morgan  = require('morgan');
const cors = require('cors');
const contractRoutes = require('./routes/contract.routes');
require('dotenv').config()

const app = express()

const PORT = process.env.PORT || 8009

app.use(cors())
app.use(express.json())
app.use(morgan('dev'))
// app.use((req, res, next) => {
//     console.log("🚀",req.body)
//     next()
// })

app.get("/", (req, res) => {
    res.status(200).json({
        "message":"Welcome to Polychain API.",
    })
})

app.use("/contract", contractRoutes)

app.listen(PORT, () => {
    console.log(`Server running at http://localhost:${PORT}`)
})