// import 'dart:html';
// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/screen/login_page.dart';
import 'package:flutter_application_1/src/screen/sign_up.dart';

class Home extends StatelessWidget {
  //BuildContext get context => null;

  Widget button1({
    required String name,
    required Color color,
    required Color textColor
  }) {
    return Container(
      height: 45,
      width: 300,
      child: RaisedButton(
        color: color,
        shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.green,width: 2),
          borderRadius: BorderRadius.circular(30),
        ),
        onPressed: () {
          //Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
        },
        child: Text(
          name,
          style: TextStyle(color: textColor),
        ),
      ),
    );
  }

Widget button2({
    required String name,
    required Color color,
    required Color textColor
  }) {
    return Container(
      height: 45,
      width: 300,
      child: RaisedButton(
        color: color,
        shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.green,width: 2),
          borderRadius: BorderRadius.circular(30),
        ),
        onPressed: () {
          //Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
        },
        child: Text(
          name,
          style: TextStyle(color: textColor),
        ),
      ),
    );
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: Center(
                child: Image.asset('images/logo2.jpeg'),
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Welcome To VNRVJIET CANTEEN",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  Column(
                    children: [
                      Text("Order food from our canteen and"),
                      Text("Make reservation in real- time")
                    ],
                  ),
                  // Container(
                  //   child: RaisedButton(onPressed: (){
                  //     Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                  //   },
                  //   child: Text("Login", style: TextStyle(color: Colors.green,),),
                  //   ),
                  // ),


                  // Container(
                  //   child: RaisedButton(onPressed: (){
                  //     Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
                  //   },
                  //   child: Text("SignUp", style: TextStyle(color: Colors.green,),),
                  //   ),
                  // ),

                  Container(
      height: 45,
      width: 300,
      child: RaisedButton(
        color: Colors.green,
        shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.green,width: 2),
          borderRadius: BorderRadius.circular(30),
        ),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
        },
        child: Text(
          "Login",
          style: TextStyle(color: Colors.white),
        ),
      ),
    ),

    Container(
      height: 45,
      width: 300,
      child: RaisedButton(
        color: Colors.white,
        shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.green,width: 2),
          borderRadius: BorderRadius.circular(30),
        ),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
        },
        child: Text(
          "SignUp",
          style: TextStyle(color: Colors.green),
        ),
      ),
    ),
                  






                  // button1(name: 'Login', color: Colors.green,textColor: Colors.white),
                  // button2(name: 'SignUp', color: Colors.white,textColor: Colors.green),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
