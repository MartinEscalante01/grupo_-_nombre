const express = require('express');
const app = express();
const path = require('path')

app.use(express.static('public')); 

app.get('/home',(req,res)=>{
    res.sendFile(path.join(__dirname,'view/index.html'))
})

app.get('/productCart',(req,res)=>{
    res.sendFile(path.join(__dirname,'view/productCart.html'))
})

app.get('/productDetail',(req,res)=>{
    res.sendFile(path.join(__dirname,'view/productDetail.html'))
})

app.get('/formulario',(req,res)=>{
    res.sendFile(path.join(__dirname,'view/index.html'))
})


app.listen(3030, (req, res)=>{
    console.log("levantando el servidor")
})