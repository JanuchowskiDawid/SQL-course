var express = require ('express');
var app = express ();
var mysql = require('mysql');

app.set("view engine", "ejs");

var connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  database : 'join_us'
});

app.get("/", function(req, res){
 var q = 'SELECT COUNT(*) AS count FROM users';
 connection.query(q, function (error, results) {
 if (error) throw error;
	var count = results[0].count;
	 res.render("home", {data: count});
 });
});

app.get("/joke", function(req, res){
 var joke = "What do you call a dog that does magic tricks? A labracadabrador.";
 res.send(joke);
});

app.get("/random_num", function(req, res){
 var num = Math.floor((Math.random() * 10) + 1);
 res.send("Your lucky number is " + num);
});

app.listen(3000, function(){
	console.log("Sever running on 3000!");
});

app.post('/register', function(req,res){
 var person = {email: req.body.email};
 connection.query('INSERT INTO users SET ?', person, function(err, result) {
 console.log(err);
 console.log(result);
 res.redirect("/");
 });
});