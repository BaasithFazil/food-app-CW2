import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:food_app/bars/order.dart';
import 'package:food_app/bars/single_item.dart';



class ScreenB extends StatefulWidget {
  const ScreenB({Key? key}) : super(key: key);

  @override
  State<ScreenB> createState() => _ScreenBState();
}

class _ScreenBState extends State<ScreenB> {

  final auth = FirebaseAuth.instance;
  final ref = FirebaseDatabase.instance.ref('Foods');

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: ref.onValue,
              builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator(
                    color: Colors.yellow,
                  ));
                } else {
                  Map<dynamic, dynamic> map = snapshot.data!.snapshot.value as dynamic;
                  List<dynamic> list = [] ;
                  list.clear();
                  list = map.values.toList();
                  return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: MediaQuery.of(context).size.width/(MediaQuery.of(context).size.height /1.2)
                      ),
                      itemCount: snapshot.data!.snapshot.children.length,
                      itemBuilder: (BuildContext context, int index){
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Container(
                              height: 100.0,
                              width: 50.0,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.9),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.grey,
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(0,3),
                                  ),
                                ],
                                border: Border.all(color: Colors.yellow, width: 3),
                              ),

                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 140.0,
                                      width: width,
                                      child: Image.network(list[index]['FoodImage'], fit: BoxFit.cover,)),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(list[index]['FoodName'], style: const TextStyle(fontSize: 17),),
                                  ),
                                  Padding(padding: const EdgeInsets.all(8.0),
                                  child: Text(list[index]["FoodPrice"]),
                                  ),

                                  Padding(
                                      padding: const EdgeInsets.all(10.0),
                                  child: ElevatedButton(
                                    onPressed: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => SinglePage()));
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.amberAccent,
                                    ),
                                    child: const Text("Add to Order"),
                                  ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }
                    );
                  }
                }
              ),
            ),
          ],
        ),
      );
    }
  }
