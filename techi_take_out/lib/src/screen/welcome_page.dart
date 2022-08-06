import 'package:flutter/material.dart';

// ignore: camel_case_types
class  welcome_page extends StatefulWidget {

  @override
  State<welcome_page> createState() => _State();
}

class _State extends State<welcome_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Expanded(child: Container(
          color: Colors.blue,
        ),
        ),
        Expanded(child: Container(
          color: Colors.green,
        ),
        )
      ],)
      
    );
  }
}