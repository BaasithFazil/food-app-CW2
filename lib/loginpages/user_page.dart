import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app/constants/lists.dart';


class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
      child: SingleChildScrollView(
        child: SizedBox(
          child: Column(
            children: [
              Text(
                "Hi!. ${user?.email!.replaceAll(RegExp('[^A-Za-z]'), '').replaceAll("com", "").replaceAll("gmail", "")}",
                style: const TextStyle(fontSize: 30,),
              ),

              SizedBox(
                height: height,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                      childAspectRatio: MediaQuery.of(context).size.width/(MediaQuery.of(context).size.height /1.2)
                  ),
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.black, width: 2),
                          ),
                          child: Column(
                            children: [

                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(userFace[index], style: const TextStyle(fontSize: 20),),
                              ),
                              const SizedBox(height: 40.0,),
                              Container(
                                height: 100.0,
                                width: 100.0,
                                decoration: const BoxDecoration(
                                  color: Colors.lime,
                                  shape: BoxShape.circle,
                                ),
                                child: Center(child: Text(userEngagement[index], style: const TextStyle(fontSize: 25),)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    )
    );
  }
}
