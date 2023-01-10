
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app/bottombar/bottombar.dart';
import 'package:food_app/constants/lists.dart';
import 'package:food_app/constants/materials.dart';
import 'package:food_app/constants/widgets.dart';
import 'package:food_app/loginpages/signup_page.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});



  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _formKey = GlobalKey<FormState>();

  static Future<User?>loginUsingEmailPassword({required String email, required String password, required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(email: email, password: password);
      user = userCredential.user;

    } on FirebaseAuthException catch (e) {
      if(e.code == errorMessages.elementAt(0)){
        print(errorMessages.elementAt(1));
      }
    }
    return user;
  }

  @override
  Widget build(BuildContext context) {

    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    bool email = false;


    return Scaffold(
      body: ColorfulSafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                child: Padding(
                  padding: MyPadding.mainPaddingA,
                  child: Text(labels.elementAt(0), style: MyStyle.subtitle,),
                ),
              ),
              Container(
                height: 350,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(Images.elementAt(0)),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: MyAlignment.crossAxisA,
                    children: [
                      Padding(
                        padding: MyPadding.paddingE,
                        child: SizedBox(
                          child: Text(labels.elementAt(1), style: MyStyle.imageName),
                        ),
                      ),
                      Padding(
                        padding: MyPadding.paddingE,
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty || !value.contains("@")) {
                              return errorMessages.elementAt(2);
                            }
                            return null;
                          },
                          controller: emailController,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            hintText: labels.elementAt(2),
                          ),
                        ),
                      ),
                      Padding(
                        padding:MyPadding.paddingE,
                        child: SizedBox(
                          child: Text(labels.elementAt(3), style: MyStyle.imageName),
                        ),
                      ),
                      Padding(
                        padding: MyPadding.paddingE,
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty || !value.contains("@")) {
                              return labels.elementAt(4);
                            }
                            return null;
                          },
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            hintText: labels.elementAt(5),
                          ),

                        ),
                      ),
                      const CustomBox(height: 5.0, width: 0.0),
                      Padding(
                        padding: MyPadding.paddingF,
                        child: SizedBox(
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
                                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const BottomBar()));
                                  }
                                });
                              },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: MyColors.amber,
                            ),
                              child: Text(labels.elementAt(0), style: MyStyle.buttonStyle),
                          ),
                        ),
                      ),
                    Padding(
                      padding: MyPadding.paddingG,
                      child: SizedBox(
                        width: double.infinity,
                        child: Row(
                          children: [
                            Text(labels.elementAt(6), style: MyStyle.imageName),
                            InkWell(
                              onTap: (){
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(builder: (BuildContext context) => const SignUpPage()),
                                    ModalRoute.withName('/headstart')
                                );
                              },
                                child: Text(labels.elementAt(7), style: MyStyle.linkButton, textAlign: TextAlign.center,)),
                          ],
                        ),
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
}

