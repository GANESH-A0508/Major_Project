import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/screen/home.dart';
import 'package:flutter_application_1/src/screen/homee.dart';
import 'package:flutter_application_1/src/screen/sign_up.dart';
import 'package:flutter_application_1/src/widget/my_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool loading=false;
  late UserCredential userCredential;
  TextEditingController Email = TextEditingController();
  TextEditingController Password = TextEditingController();
  GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

  var _auth;

  User? user;


 @override
  void initState() {
    user = FirebaseAuth.instance.currentUser ;

    if(user != null)
    {
     Navigator.push(context, MaterialPageRoute(builder: (context) => Homee()));
    }
    else {

    }
    super.initState();
  }

  Future LoginAuth() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: Email.text.trim(),
              password: Password.text.trim());
    } on FirebaseAuthException catch (e) {
      print('error from firebase auth $e');
      if (e.code == 'user-not-found') {
        globalKey.currentState?.showSnackBar(
          SnackBar(
            content: Text(
              "No user found for that email.",
            ),
          ),
        );
        // print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
         globalKey.currentState?.showSnackBar(
          SnackBar(
            content: Text(
              "Wrong password provided for that user.",
            ),
          ),
        );
        setState(() {
          loading=false;
        });
        // print('Wrong password provided for that user.');
      }
      setState(() {
          loading=false;
        });
    }
  }

  // Future signOut() async{
  //   try{
  //     return _auth.signOut();

  //   } catch(error){
  //     print(error.toString());
  //     return null;
  //   }
  // }

  void validation(){
    if(Email.text.trim().isEmpty || Email.text.trim() == null && Password.text.trim().isEmpty || Password.text.trim() == null ){
      globalKey.currentState?.showSnackBar(
        SnackBar(
          content: Text(
            "Email And Password is not Empty",
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
      LoginAuth();
    }
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 120),
              child: Text(
                "Login",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Column(
              children: [
                MyTextField(
                    hintText: "Email", obscureText: false, controller: Email),
                // textField(Iconcolor: Colors.white,icon: Icons.person_outline, hintText: "User Name", ),
                const SizedBox(
                  height: 30,
                ),
                MyTextField(
                    hintText: "Password",
                    obscureText: true,
                    controller: Password),
                // textField(Iconcolor: Colors.white,icon: Icons.lock_outline, hintText: "Password!!", ),
              ],
            ),
           loading? const CircularProgressIndicator(): Container(
              height: 60,
              width: 200,
              child: RaisedButton(
                color: Colors.red,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                onPressed: () {
                  validation();
                  
                },
                child: const Text(
                  "Login",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Forgot Passwod?",
                  style: TextStyle(color: Colors.grey),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ResetPage()));
                  },
                  child: Text(
                    "Reset Now..",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "New User?",
                  style: TextStyle(color: Colors.grey),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
                  },
                  child: Text(
                    "Register Now..",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ResetPage extends StatefulWidget {
  const ResetPage({ Key? key }) : super(key: key);

  @override
  State<ResetPage> createState() => _ResetPageState();
}

class _ResetPageState extends State<ResetPage> {
  TextEditingController controller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Reset Page", style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),),
          MyTextField(
                    hintText: "Email", obscureText: false, controller: controller),
                // textField(Iconcolor: Colors.white,icon: Icons.person_outline, hintText: "User Name", ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(onPressed: () async=>{
                  await FirebaseAuth.instance.sendPasswordResetEmail(email: controller.text).then((value) {
                    Navigator.push(context, MaterialPageRoute(builder: ((context) => LoginPage()),),);

                  }),

                }, 
                child: Text('Reset Password'),
                ),

        ],
      ),
      
    );
  }
}
