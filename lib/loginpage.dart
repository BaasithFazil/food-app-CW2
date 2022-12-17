import 'dart:io';

import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app/bottombar/screenA.dart';
import 'package:url_launcher/url_launcher.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});



  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _formKey = GlobalKey<FormState>();
  final Uri _url = Uri.parse("/second");

  static Future<User?>loginUsingEmailPassword({required String email, required String password, required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(email: email, password: password);
      user = userCredential.user;

    } on FirebaseAuthException catch (e) {
      if(e.code == "user not found"){
        print("No User found for that email");
      }
    }
    return user;
  }

  @override
  Widget build(BuildContext context) {

    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    bool email = false;

    @override
    void dispose() {
      emailController.dispose();
      passwordController.dispose();
      super.dispose();
    }

    return Scaffold(
      body: ColorfulSafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 350,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/vector/vector.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Container(
                          child: Text("Email Address", style: TextStyle(fontSize: 18),),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty || !value.contains("@")) {
                              return "Please Enter Correct Email";
                            }
                            return null;
                          },
                          controller: emailController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Enter Username",
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Container(
                          child: Text("Password", style: TextStyle(fontSize: 18),),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty || !value.contains("@")) {
                              return "Please enter the password";
                            }
                            return null;
                          },
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Enter Password",
                          ),

                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0, right: 15.0,),
                        child: Container(
                          height: 50.0,
                          width: double.infinity,
                          child: ElevatedButton(
                              onPressed: () async{
                                User? user = await loginUsingEmailPassword(email: emailController.text, password: passwordController.text, context: context);
                                print(user);

                                setState(() {
                                  emailController.text.isEmpty ? email = true : email =  false;
                                  if (user != null || _formKey.currentState!.validate()) {
                                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Processing")));
                                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const ScreenA()));
                                  }
                                });
                              },
                              child: const Text("Login", style: TextStyle(fontSize: 20),),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.amber,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Text("Don't have and account"),
                            ElevatedButton(onPressed: _launchUrl,

                                child: const Text("Let's SignUp"))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }
}

