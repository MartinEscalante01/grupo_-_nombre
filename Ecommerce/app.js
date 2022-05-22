const express = require('express');
const app = express();
const path = require('path');
const methodOverride = require('method-override');
//const multer = require('multer');


//datos
const datosProducts = require('./database/products.json');
const datosUsers = require('./database/users.json');


//Routes imports
const mainRouter = require('./routes/mainRouter');
const registerRouter = require('./routes/register.js');
const productCart = require('./routes/productCart.js');
const productDetail = require('./routes/productDetail');
const loginRouter = require('./routes/login');
const productCreate = require('./routes/productCreate');
const products = require('./routes/products');
const users = require('./routes/users');
//const productEdit = require('./routes/productEdit');
const { error } = require('console');


//middlewares
app.set('view engine','ejs');
app.set('views',__dirname + '/view');


app.use(express.static('public')); 

app.use(express.urlencoded({ extended: false }));
app.use(express.json());
app.use(methodOverride('_method'));

app.use(express.urlencoded({extender: false}));
app.use(express.json());

app.use('/',mainRouter);
app.use('/login',loginRouter);
app.use('/register',registerRouter);
app.use('/productCart',productCart);
app.use('/productDetail', productDetail);
app.use('/productCreate', productCreate);
//app.use('/productEdit', productEdit);
app.use('/products', products);
app.use('/users', users);


app.get('/datosProducts', (req,res) =>{
    res.json (datosProducts );
});

app.get('/datosUsers', (req,res) =>{
    res.json (datosUsers );
<<<<<<< HEAD
})

=======
});
>>>>>>> 8d9c1d6765f9511784d7ebfe7c3b33ec0b51b509

app.use('/',  (req, res) => { 
    res.status(404).send('not-found');
});


// Servidor
let port = process.env.PORT || 3030;

app.listen(port, ()=> {
    console.log(`Servidor corriendo en el puerto ${port}`);
});








