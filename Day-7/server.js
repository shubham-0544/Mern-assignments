const express = require('express');

const userRouter = require('./routes/user')
const authUser = require('./utils/auth')
const app = express();

// middlewares
app.use(express.json())
app.use(authUser)
app.use('/user', userRouter)

app.listen(4000, 'localhost', () => {
    console.log('Server is running on 4000');
}); 