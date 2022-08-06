import 'package:flutter/material.dart';


import 'package:flutter_application_1/src/screen/homee.dart';class AboutPage extends StatefulWidget {
  const AboutPage({ Key? key }) : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('About User'),
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
            // child: SingleChildScrollView(

            //   child: _textFormField()),
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