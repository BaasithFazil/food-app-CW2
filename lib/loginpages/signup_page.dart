import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app/constants/lists.dart';
import 'package:food_app/constants/materials.dart';
import 'package:food_app/loginpages/login_page.dart';


class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();


    Future signUp() async {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text);
      return const LoginPage();
    }

    return Scaffold(
      body: ColorfulSafeArea(
        child:SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              child: Padding(
                padding: MyPadding.mainPaddingA,
                child: Text(labels.elementAt(8), style: MyStyle.subtitle),
              ),
            ),
            Container(
              height: 350.0,
              width: double.infinity,
              decoration: BoxDecoration(
                color: MyColors.grey,
                image: DecorationImage(
                  image: AssetImage(vectorImages.elementAt(1)),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 400.0,
              child: Column(
                mainAxisAlignment: MyAlignment.mainAxisA,
                crossAxisAlignment: MyAlignment.crossAxisA,
                children: [
                  Padding(
                    padding: MyPadding.paddingI,
                    child: SizedBox(
                    child: Text(mainLabels.elementAt(0), style: MyStyle.foodNames),
                  ),),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                    child: TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Enter Username",
                      ),
                    ),
                  ),
                  Padding(
                    padding: MyPadding.paddingE,
                    child: SizedBox(
                      child: Text(mainLabels.elementAt(1), style: MyStyle.imageName),
                    ),),
                  Padding(
                    padding: MyPadding.paddingE,
                    child: TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: labels.elementAt(5),
                      ),
                    ),
                  ),
                  Padding(
                    padding: MyPadding.paddingJ,
                    child: SizedBox(
                      width: double.infinity,
                      height: 50.0,
                      child: ElevatedButton(
                          onPressed: (){
                            signUp();
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
                            emailController.text = "";
                            passwordController.text = "";
                          },style: ElevatedButton.styleFrom(
                        backgroundColor: MyColors.amber,
                      ),
                          child: Text(labels.elementAt(8), style: MyStyle.foodPrice),),
                    ),
                  ),
                  Padding(
                    padding: MyPadding.paddingG,
                    child: SizedBox(
                      width: double.infinity,
                      child: Row(
                        children: [
                          Text(labels.elementAt(9), style: MyStyle.imageName),
                          InkWell(
                              onTap: (){
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(builder: (BuildContext context) => const LoginPage()),
                                ModalRoute.withName('/headstart'));
                              },
                              child: Text(labels.elementAt(10), style: MyStyle.linkButton, textAlign: TextAlign.center,)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        ),
      ),
    );
  }
}
