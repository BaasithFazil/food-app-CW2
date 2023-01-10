import 'dart:ui';

import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';


class HeadStart extends StatelessWidget {
  const HeadStart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: ColorfulSafeArea(
        color: Colors.white.withOpacity(0.7),
        overflowRules: const OverflowRules.all(false),
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/image.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  height: 100.0,
                  width: 300.0,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(243,240, 233, 0.3),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: const Text("Welcome to our Food App", textAlign: TextAlign.center, style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: Colors.white),),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0,bottom: 10.0),
                    child: SizedBox(
                      height: 50.0,
                      width: double.infinity,
                      child: ElevatedButton(onPressed: (){
                        Navigator.pushNamed(context, '/login');
                      }, child: const Text("Login"))
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0,bottom: 40.0),
                    child: Container(
                        height: 50.0,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blue.withOpacity(0.1),
                              blurRadius: 7,
                              spreadRadius: 8,
                              offset: const Offset(0, 2),
                            )
                          ],
                        ),
                        child: ElevatedButton(
                            onPressed: (){
                              Navigator.pushNamed(context, '/signup');
                            },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.amber,
                          ), child: const Text("SignUp"),
                        ),
                    ),
                  ),

                ],
              ),

            ],
          ),
        ),
      ),
    );

  }
}
