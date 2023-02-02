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






































// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// // import 'firebase_options.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';

// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   // If you're going to use other Firebase services in the background, such as Firestore,
//   // make sure you call `initializeApp` before using other Firebase services.
//   await Firebase.initializeApp();

//   print("Handling a background message: ${message.messageId}");
// }

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     // options: DefaultFirebaseOptions.currentPlatform,
//   );
//   FirebaseMessaging messaging = FirebaseMessaging.instance;
//   FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

//   FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//     print('Got a message whilst in the foreground!');
//     print('Message data: ${message.data}');

//     if (message.notification != null) {
//       print('Message also contained a notification: ${message.notification}');
//     }
//   });
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             ElevatedButton(
//                 onPressed: () async {
//                   await FirebaseMessaging.instance
//                       .subscribeToTopic('myTopic');
//                 },
//                 child: Text('Subscribe To Topic')),
//             ElevatedButton(
//                 onPressed: () async {
//                   await FirebaseMessaging.instance
//                       .unsubscribeFromTopic('myTopic');
//                 },
//                 child: Text('un Subscribe To Topic')),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }