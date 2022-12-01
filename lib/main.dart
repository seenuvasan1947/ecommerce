// ignore_for_file: unused_import

// // ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ecommerce/login/screen/home_screen.dart';
import 'package:ecommerce/login/screen/login_screen.dart';
import 'package:ecommerce/login/screen/signup_screen.dart';
import 'package:ecommerce/login/screen/welcome_screen.dart';
// import 'package:ecommerce/login/welcome_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:furniture/constants.dart';
import 'package:ecommerce/screens/product/products_screen.dart';
// import 'package:google_fonts/google_fonts.dart';
// import '';
Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}


//  void main() async {
//    WidgetsFlutterBinding.ensureInitialized();
//    await Firebase.initializeApp();
//    runApp(const MyApp());
//  }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Furniture app',
      // theme: ThemeData(
      //   // We set Poppins as our default font
      //   textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
      //   primaryColor: kPrimaryColor,
      //   accentColor: kPrimaryColor,
      //   visualDensity: VisualDensity.adaptivePlatformDensity,
      // ),
      // home: ProductsScreen(),
      // home:WelcomeScreen()
      initialRoute: 'welcome_screen',
      routes: {
        'welcome_screen': (context) => WelcomeScreen(),
        'registration_screen': (context) => RegistrationScreen(),
        'login_screen': (context) => LoginScreen(),
        'home_screen': (context) => HomeScreen(),
        'product_screen':(context) =>ProductsScreen()
      },
    );
  }
}
