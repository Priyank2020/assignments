// var express=require('express');
// var app = express();
// var bodyparser = require('body-parser');
// app.use(bodyparser.json);
// // app.use(bodyParser.urlencoded({
// //     extended: true
// // }));


// module.exports = app;
// var mysql = require('mysql')

// const con = mysql.createConnection({
//     host: 'localhost',
//     user: 'root',
//     password: 'root',
//     database:'employeedb'
//   });
//   con.connect((err) => {
//     if(err){
//       console.log('Error connecting to Db');
//       return;
//     }
//     console.log('Connection established');
//   });

//     app.listen(3030,()=>console.log('Express server is running at port no : 3030'));

// // var http = require('http');


// // http.createServer(function(req, res) {}).on('error', console.log).listen(3000);

// // // These should all print the error object to console
// // http.createServer(function(req, res) {}).on('error', console.log).listen(3000);
// // http.createServer(function(req, res) {}).listen(3000).on('error', console.log);
// // app.listen(3000).on('error', console.log);

// // app.get('/employees',(res,req)=>{
// //     mysqlConnection.query('SELECT * FROM users',(err,rows,fields)=>{
// //         if(!err)
// //         console.log(rows);
// //         else
// //         console.log(err);
// //     })
// // });
// // Retrieve all users 
// // app.get('/users', function (req, res) {
// //     return res.send({ error: false, data: {}, message: 'users list.' });
// //     // con.query('SELECT * FROM users', function (error, results, fields) {
// //     //     if (error) throw error;
// //     //     return res.send({ error: false, data: results, message: 'users list.' });
// //     // });
// // });

// app.get('/users', function (req, res) {
//     console.log("get user")
//     con.query('SELECT * FROM users', function (error, results, fields) {
//         if (error) throw error;
//         return res.send({ error: false, data: results, message: 'users list.' });
//     });
// });


//  // default route
//  app.get('/', function (req, res) {
//      console.log("yes")
//     return res.send({ error: true, message: 'hello' })
// });

var express = require('express');
var app = express();
var bodyParser = require('body-parser');

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({
    extended: true
}));

module.exports = app;
var mysql = require('mysql')

const con = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'root',
    database: 'employeedb'
});
con.connect((err) => {
    if (err) {
        console.log('Error connecting to Db');
        return;
    }
    console.log('Connection established');
});
// set port
app.listen(3050, () => console.log('Express server is running at port no : 3050'));
// default route
app.get('/', function (req, res) {
    return res.send({ error: true, message: 'hello' })
});

//select users
app.get('/users', function (req, res) {
    console.log("get user")
    con.query('SELECT * FROM users', function (error, results, fields) {
        if (error) throw error;
        return res.send({ error: false, data: results, message: 'users list.' });
    });
});

// Add a new user  
app.post('/user', function (req, res) {
    let user = req.body;

    console.log(user);
    if (!user) {
      return res.status(400).send({ error:true, message: 'Please provide user' });
    }
   con.query("INSERT INTO users(id,name,email,created_at) VALUES(?,?,?,?)",[user.id,user.name,user.email,user.created_at], function (error, results, fields) {
  if (error) throw error;
    return res.send({ error: false, data: results, message: 'New user has been created successfully.' });
    });
});

//  Delete user
app.delete('/user', function (req, res) {
  
    let user_id = req.body.id;
  
    if (!user_id) {
        return res.status(400).send({ error: true, message: 'Please provide user_id' });
    }
    con.query('DELETE FROM users WHERE id = ?', [user_id], function (error, results, fields) {
        if (error) throw error;
        return res.send({ error: false, data: results, message: 'User has been updated successfully.' });
    });
}); 

//  Update user with id
// app.put('/user', function (req, res) {
    
//     let user = req.body;
//     if (!user_id || !user) {
//       return res.status(400).send({ error: user, message: 'Please provide user and user_id' });
//     }
//     con.query("UPDATE users SET user = ? WHERE id = ?", [user.name, user.id], function (error, results, fields) {
//       if (error) throw error;
//       return res.send({ error: false, data: results, message: 'user has been updated successfully.' });
//      });
//     });