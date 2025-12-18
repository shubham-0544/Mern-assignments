const mysql2 = require('mysql2');

const pool = mysql2.createpool({
    host :'localhost',
    user :'root',
    password :'manager',
    database :'classwork'
});
Module.exports = pool;