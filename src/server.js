const express = require('express')
require('dotenv').config()

const app = express()

const PORT = process.env.PORT || 8009


app.get("/", (req, res) => {
    res.status(200).json("Welcome to Polychain API.")
})

app.listen(PORT, () => {
    console.log(`Server running at http://localhost:${PORT}`)
})