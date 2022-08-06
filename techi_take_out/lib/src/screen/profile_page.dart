import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/screen/homee.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Widget _textFormField() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 15),
          child: TextFormField(
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              counterStyle: TextStyle(color: Colors.black),
              focusColor: Colors.black,
              icon: Icon(Icons.email),
              hintText: 'Email',
              hintStyle: TextStyle(
              color: Colors.black,
              ), 
            ), // Input Decoration
          ), // TextFormField
        ), 
        Padding(
          padding: EdgeInsets.symmetric(vertical: 15),
          child: TextFormField(
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              counterStyle: TextStyle(color: Colors.black),
              focusColor: Colors.black,
              icon: Icon(Icons.person),
              hintText: 'First Name',
              hintStyle: TextStyle(
              color: Colors.black,
              ), 
            ), // Input Decoration
          ), // TextFormField
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 15),
          child: TextFormField(
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              counterStyle: TextStyle(color: Colors.black),
              focusColor: Colors.black,
              icon: Icon(Icons.person),
              hintText: 'Last Name',
              hintStyle: TextStyle(
              color: Colors.black,
              ), 
            ), // Input Decoration
          ), // TextFormField
        ), // Padding
        Padding(
          padding: EdgeInsets.symmetric(vertical: 15),
          child: TextFormField(
            obscureText: true,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              counterStyle: TextStyle(color: Colors.black),
              focusColor: Colors.black,
              icon: Icon(Icons.lock),
              hintText: 'Password',
              hintStyle: TextStyle(
              color: Colors.black,
              ), 
            ), // Input Decoration
          ), // TextFormField
        ), 
        SizedBox(height: 20,),
        Container(
          height: 55,
          width: 100,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(90, 20, 20, 20),
                blurRadius: 10,
                offset: Offset(6, 6),
              )
            ]

          ),

          child: RaisedButton(
            color: Color(0xfff6f6f6f6),
            onPressed: (){}, child:  Text('Update', style: TextStyle(color: Colors.black),),),
        )
        
      ],
    ); // Column
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Homee()),
            );
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Stack(
        children: [
          Container(
            color: Color(0xfff6f6f6f6),
            height: double.maxFinite,
            width: double.infinity,
            padding: EdgeInsets.only(top: 250, left: 20, right: 20),
            child: SingleChildScrollView(

              child: _textFormField()),
          ),
          Container(
            height: 180,
            color: Colors.white,
          ),
          Container(
            width: double.infinity,
            height: 190,
            margin: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            decoration: BoxDecoration(
                color: Color(0xfff6f6f6f6),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Color.fromARGB(90, 20, 20, 20),
                      blurRadius: 0.8,
                      offset: Offset(9, 9))
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 45,
                  child: CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: 42,
                    backgroundImage: AssetImage('images/logo2.jpeg'),
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  'Ganesh Durgam',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  '@GaneshDurgam143',
                  style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
