// // ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api

// ignore_for_file: use_build_context_synchronously

import 'package:ecommerce/login/components/rounded_button.dart';
import 'package:ecommerce/login/screen/dash_board.dart';
import 'package:ecommerce/login/screen/userdetail.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';

// import 'components/rounded_button.dart';

// class WelcomeScreen extends StatefulWidget {
//   @override
//   _WelcomeScreenState createState() => _WelcomeScreenState();
// }

// class _WelcomeScreenState extends State<WelcomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.white,
//         body: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 24.0),
//           child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: <Widget>[
//                 RoundedButton(
//                   colour: Colors.lightBlueAccent,
//                   title: 'LogIn',
//                   onPressed: () {
//                     Navigator.pushNamed(context, 'login_screen');
//                   },
//                 ),
//                 RoundedButton(
//                     colour: Colors.blueAccent,
//                     title: 'Register',
//                     onPressed: () {
//                       Navigator.pushNamed(context, 'registration_screen');
//                     }),
//               ]),
//         ));
//   }
// }

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final auth = FirebaseAuth.instance;

  Future<String?> userLogin(LoginData data) async {
    try {
      final newuser = await auth.signInWithEmailAndPassword(
          email: data.name, password: data.password);
      if (newuser != null) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const dashborad()));
      }
    } catch (e) {}
  }

  Future<String?> usersignup(SignupData data) async {
    try {
      final newuser = await auth.createUserWithEmailAndPassword(
          email: data.name.toString(), password: data.password.toString());
      if (newuser != null) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const detailpage()));
      }
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome '),
          centerTitle: true,
        ),
        body: FlutterLogin(
            onLogin: userLogin,
            onSignup: usersignup,
            onRecoverPassword: recovery),
      ),
    );
  }

  Future<String?>? recovery(String p1) {}
}
