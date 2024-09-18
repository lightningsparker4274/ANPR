import 'package:flutter/services.dart';
import 'package:numbers/reusable_widgets/reusable_widget.dart';
//import 'package:numbers/screens/NumberPlate.dart';
import 'package:numbers/screens/NumberPlateRecognizer.dart';
import 'package:numbers/screens/second.dart';
import 'package:numbers/screens/signup_screen.dart';
import 'package:numbers/utils/color_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:numbers/screens/new.dart';
class Signin_Screen extends StatefulWidget {
  const Signin_Screen({Key? key}) : super(key: key);

  @override
  State<Signin_Screen> createState() => _Signin_ScreenState();
}

class _Signin_ScreenState extends State<Signin_Screen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return Scaffold(
      body: Container(
        width: MediaQuery
            .of(context)
            .size
            .width,
        height: MediaQuery
            .of(context)
            .size
            .height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              hexStringToColor("CB2B93"),
              hexStringToColor("9546C4"),
              hexStringToColor("5E61F4")
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter
            )),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery
                .of(context)
                .size
                .height * 0.2, 20, 0),
            child: Column(
              children: <Widget>[
                logoWidget("assets/images/images.png"),
                SizedBox(
                  height: 30,
                ),
                reusableTextField("Enter E-mail", Icons.person_outline, false,
                    _emailTextController),
                SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Password", Icons.person_outline, true,
                    _passwordTextController),
                SizedBox(
                  height: 20,
                ),
                signInSignUpButton(context, true, () {
                  FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                      email: _emailTextController.text,
                      password: _passwordTextController.text).then((value) {
                    Navigator.push(context, MaterialPageRoute(builder: (
                        context) => Second()));
                  }).onError((error, stackTrace) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Error'),
                          content: Text("The Given Login Credentials is Invalid"),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );

                  });
                }),
                signUpOption()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row signUpOption() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Don't have account?",
              style: TextStyle(color: Colors.white70)), // Text
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SignUpScreen()));
            },
            child: const Text(
              "Sign Up",
              style: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ), // Text
          )
        ] // GestureDetector
    ); // Row
  }
}
