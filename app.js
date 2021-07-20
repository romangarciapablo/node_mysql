const express = require('express');
const mysql = require('mysql');

const bodyParser = require('body-parser');

const PORT = process.env.PORT || 3050;

const app = express();

app.use(express.urlencoded({ extended: true }));
app.use(express.json());

app.use(express.urlencoded({extended: true}))

// mysql
const connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'MySQLKey.01',
    database: 'PhonesDataset',
}); 

// Route
app.get('/api', (req, res) => {
    res.send('Welcome to the API of phones project')
})

// all phones
app.get('/api/product', (req, res) => {
    const sql = "select p.*, pc.image_url, c.color, s.storage from phones p " +
    "left join phone_color pc on p.id=pc.phone_id " +
    "left join colors c on pc.color_id=c.id " +
    "left join phone_storage ps on p.id=ps.phone_id " +
    "left join storage s on ps.storage_id=s.id";
    connection.query(sql, (error, result)=>{
        if (error) throw error;
        if (result.length > 0){
            res.json(result);
        } else {
            res.send('None results')
        }
    })
})
app.get('/api/product/:id', (req, res) => {
    const { id } = req.params;

    const sql = "select p.*, pc.image_url, c.color, s.storage from phones p " +
    "left join phone_color pc on p.id=pc.phone_id " +
    "left join colors c on pc.color_id=c.id " +
    "left join phone_storage ps on p.id=ps.phone_id " +
    "left join storage s on ps.storage_id=s.id " +
    "where p.id = " + id;

    connection.query(sql, (error, result)=>{
        if (error) throw error;
        if (result.length > 0){
            res.json(result);
        } else {
            res.send('None results')
        }
    })
})
app.post('/api/cart', (req, res) => {
    const sql = "INSERT INTO cart set ?";

    console.log("ASDF");
    console.log("El body es qwer " + JSON.stringify(req.body));
    
    const cartElementObj = {
        user_id: req.body.user || 1,
        phone_id: req.body.id,
        color_id: req.body.colorCode,
        storage_id: req.body.storageCode
    }

    connection.query(sql, cartElementObj, error => {
        if (error) throw error;
        res.send('Customer created!');
    });
})

app.get('/api/cart/:id', (req, res) => {
    const { id } = req.params;

    const sql = "select p.*, pc.image_url, c.color, s.storage from cart " +
    "left join phones p on p.id=cart.phone_id " +
    "left join colors c on cart.color_id=c.id " +
    "left join storage s on cart.storage_id=s.id " +
    "where cart.user_id = " + id;

    connection.query(sql, (error, result)=>{
        if (error) throw error;
        if (result.length > 0){
            res.json(result);
        } else {
            res.send('None results')
        }
    })
})

// Check conection
connection.connect(error => {
    if (error) throw error;
    console.log('mysql connection works properly')
});

app.listen(PORT, ()=> console.log('Server running on port' + PORT));