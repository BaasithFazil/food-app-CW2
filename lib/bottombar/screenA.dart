import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class ScreenA extends StatelessWidget {
  const ScreenA({super.key});


  @override
  Widget build(BuildContext context) {


    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircleAvatar(),
                  const Text("Food App"),
                  IconButton(onPressed: (){
                    Navigator.pushReplacementNamed(context, '/first');
                  }, icon: const Icon(Icons.exit_to_app)),

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text("Get your food", style: TextStyle(fontSize: 20.0, color: Colors.grey),),
                    Text("Quick Delivery", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Categories", style: TextStyle(fontSize: 26,),),
                  SizedBox(
                    width: double.infinity,
                    height: 150.0,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 90.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  color: Colors.red
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Icons.add),
                                  const Text("Pizza"),
                                  IconButton(onPressed: (){}, icon: const Icon(Icons.add)),
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                  const Text("Popular Now", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),

                  SizedBox(
                    width: double.infinity,
                    height: 200.0,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 150,
                              height: 120.0,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
          ],

        ),
      ),
    );
  }
}

logOut() {
  FirebaseAuth.instance.signOut();
}