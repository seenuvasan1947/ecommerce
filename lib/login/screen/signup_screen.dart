// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, unnecessary_null_comparison, use_build_context_synchronously, avoid_print

import 'package:ecommerce/login/components/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
// import 'package:modal_progress_hud/modal_progress_hud.dart';
// import 'components/rounded_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//code for designing the UI of our text field where the user writes his email id or password
// var db = FirebaseFirestore.instance;
const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter a value',
  hintStyle: TextStyle(color: Colors.grey),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  late String name;
  late String phone;
  late String? type = "customer";
  bool showSpinner = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextField(
                  keyboardType: TextInputType.name,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    name = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter your name')),
              const SizedBox(
                height: 8.0,
              ),
              TextField(
                  keyboardType: TextInputType.phone,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    phone = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter your phone')),
              const SizedBox(
                height: 8.0,
              ),
              TextField(
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter your email')),
              const SizedBox(
                height: 8.0,
              ),
              TextField(
                  obscureText: true,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    password = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter your Password')),
              const SizedBox(
                height: 24.0,
              ),
              RadioListTile(
                  value: "seller",
                  groupValue: type,
                  onChanged: (value) {
                    setState(() {
                      type = value.toString();
                    });
                  }),
              RadioListTile(
                  value: "customer",
                  groupValue: type,
                  onChanged: (value) {
                    setState(() {
                      type = value.toString();
                    });
                  }),
              RoundedButton(
                colour: Colors.blueAccent,
                title: 'Register',
                onPressed: () async {
                  setState(() {
                    showSpinner = true;
                  });
                  try {
                    final newUser = await _auth.createUserWithEmailAndPassword(
                        email: email, password: password);

                    final info = <String, dynamic>{
                      "name": name,
                      "email": email,
                      "phone": phone,
                      "password": password,
                      "type": type
                    };
                    await FirebaseFirestore.instance
                        .collection("login")
                        .doc(email)
                        .set(info);

                    if (newUser != null) {
                      Navigator.pushNamed(context, 'product_screen');
                    }
                  } catch (e) {
                    print(e);
                  }
                  setState(() {
                    showSpinner = false;
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
