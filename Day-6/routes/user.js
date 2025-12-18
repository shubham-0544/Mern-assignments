const express = require('express')
const cryptojs = require('crypto-js')
const pool = require('../db/pool')
const result = require('../utils/result')

const router = express.Router()

router.post('/signup', (req, res) => {
    const { name, email, password, mobile } = req.body
    const sql = `INSERT INTO users(name,email,password,mobile) VALUES (?,?,?,?)`
    const hashedPassword = cryptojs.SHA256(password).toString()
    pool.query(sql, [name, email, hashedPassword, mobile], (error, data) => {
        res.send(result.createResult(error, data))
    })
})