import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/screen/home.dart';
import 'package:flutter_application_1/src/screen/login_page.dart';
import 'package:flutter_application_1/src/widget/my_text_field.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);
  // static Pattern pattern =
  //     r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool loading=false;
  late UserCredential userCredential;
  // RegExp regExp = RegExp(SignUp.pattern);
  TextEditingController FirstName = TextEditingController();
  TextEditingController LastName = TextEditingController();
  TextEditingController Email = TextEditingController();
  TextEditingController Password = TextEditingController();
  GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

  Future sendData() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: Email.text, password: Password.text);
      await FirebaseFirestore.instance.collection('useData').doc(userCredential.user?.uid).set({
        'FirstName': FirstName.text.trim(),
        'LastName': LastName.text.trim(),
        'Emai': Email.text.trim(),
        'userid': userCredential.user?.uid.trim(),
        'Passsword': Password.text.trim(),
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        //globalKey.currentState?.showSnackBar(SnackBar(context: Text("The password provided is too weak.")));
        globalKey.currentState?.showSnackBar(
          SnackBar(
            content: Text(
              "The password provided is too weak.",
            ),
          ),
        );
        // print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        globalKey.currentState?.showSnackBar(
          SnackBar(
            content: Text(
              "The account already exists for that email.",
            ),
          ),
        );
        //globalKey.currentState?.showSnackBar(SnackBar(context: Text("The account already exists for that email.")));
        // print('');
      }
    } catch (e) {
      globalKey.currentState?.showSnackBar(
        SnackBar(
          content: Text('e'),
        ),
      );
      setState(() {
        loading=false;
        //Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
      });
    }
    setState(() {
        loading=false;
        //Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));

      });
      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
  }

  // Widget textField({required String hintText, }) {

  void validation() {
    if (FirstName.text.trim().isEmpty || FirstName.text.trim() == null) {
      globalKey.currentState?.showSnackBar(
        SnackBar(
          content: Text(
            "firstName is Empty",
          ),
        ),
      );
      return;
    }
    if (LastName.text.trim().isEmpty || LastName.text.trim() == null) {
      globalKey.currentState?.showSnackBar(
        SnackBar(
          content: Text(
            "lastName is Empty",
          ),
        ),
      );
      return;
    }
    if (Email.text.trim().isEmpty || Email.text.trim() == null) {
      globalKey.currentState?.showSnackBar(
        SnackBar(
          content: Text(
            "Email is Empty",
          ),
        ),
      );
      return;
    }
    // } else if (!regExp.hasMatch(Email.text)) {
    //   globalKey.currentState?.showSnackBar(
    //     SnackBar(
    //       content: Text(
    //         "Please enter vaild Email",
    //       ),
    //     ),
    //   );
    //   return;
    // }
    if (Password.text.trim().isEmpty || Password.text.trim() == null) {
      globalKey.currentState?.showSnackBar(
        SnackBar(
          content: Text(
            "Password is Empty",
          ),
        ),
      );
      return;
    }
    else{
      setState(() {
        loading=true;
      });
      sendData();
    }
  }

  Widget button(
      {required String buttonName,
      required Color color,
      required Color textcolor,
      required Function() ontap}) {
    return Container(
      width: 120,
      child: RaisedButton(
          color: color,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          child: Text(
            buttonName,
            style: TextStyle(fontSize: 20, color: textcolor),
          ),
          onPressed: ontap),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
            }),
      ),


      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Sign Up",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 40),
              ),
              Container(
                height: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyTextField(
                      controller: FirstName,
                      obscureText: false,
                      hintText: "FirstName",
                    ),
                    MyTextField(
                      controller: LastName,
                      obscureText: false,
                      hintText: "LastName",
                    ),
                    MyTextField(
                      controller: Email,
                      obscureText: false,
                      hintText: "Email",
                    ),
                    MyTextField(
                      controller: Password,
                      obscureText: true,
                      hintText: "Password",
                    ),
                  ],
                ),
              ),
             loading?Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 CircularProgressIndicator(),
               ],
             )
             :Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  button(
                      ontap: () {
                        //validation();
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
                      },
                      buttonName: "Cancel",
                      color: Colors.grey,
                      textcolor: Colors.black),
                  SizedBox(
                    width: 20,
                  ),
                  button(
                      ontap: () {
                        validation();
                      },
                      buttonName: "Sign Up",
                      color: Colors.red,
                      textcolor: Colors.white),
                ],
              ),

              Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: TextStyle(color: Colors.grey),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  child: Text(
                    "Login Here..",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            )
            ],
          ),
        ),
      ),
    );
  }
}
