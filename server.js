require('dotenv').config()
const express = require('express')
const app = express()
const cors = require('cors')
const fileUpload = require('express-fileupload')

// middlewares
app.use(cors())
app.use(express.json())
app.use(fileUpload())


// routers 
const adminRouter = require('./routes/admin')
app.use('/api/admin', adminRouter)

const planRouter = require('./routes/plan')
app.use('/api/plan', planRouter)

const adRouter = require('./routes/ad')
app.use('/api/promo', adRouter)

const convoRouter = require('./routes/convo')
app.use('/api/convo', convoRouter)

const webRouter = require('./routes/web')
app.use('/api/web', webRouter)

const apiRouter = require('./routes/api')
app.use('/api/api', apiRouter)

const transRouter = require('./routes/trans')
app.use('/api/trans', transRouter)

const testimonialRouter = require('./routes/testimonial')
app.use('/api/testimonial', testimonialRouter)

const faqRouter = require('./routes/faq')
app.use('/api/faq', faqRouter)

const pageRouter = require('./routes/page')
app.use('/api/page', pageRouter)

const testRouter = require('./routes/test')
app.use('/api/test', testRouter)


// linking client 
const path = require("path");

app.use(express.static(path.resolve(__dirname, "./client/public")));

app.get("*", function (request, response) {
    response.sendFile(path.resolve(__dirname, "./client/public", "index.html"));
});


app.listen(process.env.PORT || 3001, () => {
    console.log(`Postcam api is running on port ${process.env.PORT}`)
})


