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


// Check conection
connection.connect(error => {
    if (error) throw error;
    console.log('mysql connection works properly')
});

app.listen(PORT, ()=> console.log('Server running on port' + PORT));