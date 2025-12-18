const express = require("express")
const pool = require("../db/pool")
const result = require("../utils/result")

const router = express.Router()

router.get("/", (req, res) => {
    const sql = `SELECT * FROM books`
    pool.query(sql, (error, data) => {
        res.send(result.createResult(error, data))
    })
})