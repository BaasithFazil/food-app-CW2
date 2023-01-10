

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_app/bottombar/bottombar.dart';
import 'package:food_app/bottombar/screenA.dart';
import 'package:food_app/bottombar/screenB.dart';
import 'package:food_app/constants/materials.dart';
import 'package:food_app/splashscreen/headstart.dart';
import 'package:food_app/loginpages/loginpage.dart';
import 'package:food_app/loginpages/signup_page.dart';
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
        primarySwatch: MyColors.blue,
      ),
      home: const SplashScreen(),
      initialRoute:'/bottom',
      routes: {
          '/main': (context) => const SplashScreen(),
          '/headstart': (context) => const HeadStart(),
        '/login' : (context) => const LoginPage(),
        '/signup': (context) => const SignUpPage(),
        '/screenA': (context) => const ScreenA(),
        '/screenB': (context) => const ScreenB(),
        '/bottom': (context) => const BottomBar(),
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


