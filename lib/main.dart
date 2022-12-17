

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_app/bottombar/bottombar.dart';
import 'package:food_app/bottombar/screenA.dart';
import 'package:food_app/headstart.dart';
import 'package:food_app/loginpage.dart';
import 'package:food_app/signup_page.dart';
import 'package:food_app/splashscreen/homesplash.dart';
import 'package:food_app/splashscreen/splashscreen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
      initialRoute:'/main',
      routes: {
          '/main': (context) => SplashScreen(),
          '/major': (context) => HeadStart(),
        '/first' : (context) => LoginPage(),
        '/second': (context) => SignUpPage(),
      },
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _initializeFirebase(),
        builder:  (context, snapshot){
          if(snapshot.connectionState == ConnectionState.done) {
            return const LoginPage();
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}


