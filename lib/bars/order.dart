import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:food_app/bars/payment.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<http.Response> fetchData(http.Client client) async {
  return client.get(Uri.parse('https://console.firebase.google.com/project/login-access-f3987/database/login-access-f3987-default-rtdb/data/~2F'));
}


class Foods {
  String foodName;
  String foodDescription;
  String foodImage;
  String foodPrice;

  Foods(
      {required this.foodName, required this.foodDescription, required this.foodImage, required this.foodPrice});

  factory Foods.fromJson(Map<String, dynamic>json) {
    return Foods(
      foodName: json['FoodName'],
      foodDescription: json['FoodDescription'],
      foodImage: json['FoodImage'],
      foodPrice: json['FoodPrice'],
    );
  }

  List<Foods> parseData(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<Foods>((json) => Foods.fromJson(json)).toList();
  }

  Future<List<Foods>> fetchData(http.Client client) async {
    final response = await client
        .get(Uri.parse(
        'https://console.firebase.google.com/project/login-access-f3987/database/login-access-f3987-default-rtdb/data/~2F'));

    // Use the compute function to run parsePhotos in a separate isolate.
    return parseData(response.body);
  }
}
class FoodPack {
  final String name;
  final String price;

  FoodPack({required this.name, required this.price});
}



class ScreenC extends StatefulWidget {
  const ScreenC({super.key,});

  @override
  State<ScreenC> createState() => _ScreenCState();
}

class _ScreenCState extends State<ScreenC> {
  void _showDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Thank You'),
            content: const Text('We will recieve your information. Thankyou for ordering'),
            actions: [
              MaterialButton(
                color: Colors.deepPurple[200],
                onPressed: () {
                  // do something
                  print('Ok button pressed');
                },
                child: const Text('Ok'),
              ),
            ],
          );
        });
  }
    final _formKey = GlobalKey<FormState>();
    final addressController = TextEditingController();
    final cnameController = TextEditingController();
    final fnameController = TextEditingController();
    final priceController = TextEditingController();


  bool loading = false;
  final databaseRef = FirebaseDatabase.instance.ref('Order');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10.0,
              ),
              Container(
                height: 250.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/order.jpg"),

                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 15.0),
                height: 20.0,
                width: double.infinity,
                child: Text("Please fill the order details here", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              ),
                SizedBox(
                  height: 20.0,
                ),
                Form(
                  key: _formKey,
                  child:
                      Column(
                        children :[
                          TextFormField(

                    controller: addressController,
                    decoration: InputDecoration(
                      hintText: "Address to deliver...",
                      labelText: "Address",
                      labelStyle: TextStyle(fontSize: 20.0, color: Colors.amber),
                      hintStyle: TextStyle(fontSize: 18.0),
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    validator: (value){
                      if (value == null || value.isEmpty) {
                        return "Please provide the name";
                      }
                      return null;
                    },
                  ),
                          SizedBox(
                            height: 20.0,
                          ),
                          TextFormField(
                            controller: cnameController,
                            decoration: InputDecoration(
                              hintText: "Customer Name",
                              labelText: "Customer",
                              labelStyle: TextStyle(fontSize: 20.0, color: Colors.amber),
                              hintStyle: TextStyle(fontSize: 18.0),
                              filled: true,
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            ),
                            validator: (value){
                              if (value == null || value.isEmpty) {
                                return "Please provide the name";
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          TextFormField(
                            controller: fnameController,
                            decoration: InputDecoration(
                              hintText: "Food Name",
                              labelText: "Food Name",
                              labelStyle: TextStyle(fontSize: 20.0, color: Colors.amber),
                              hintStyle: TextStyle(fontSize: 18.0),
                              filled: true,
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            ),
                            validator: (value){
                              if (value == null || value.isEmpty) {
                                return "Please provide the name";
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          TextFormField(
                            controller: priceController,
                            decoration: InputDecoration(
                              hintText: "Price",
                              labelText: "Price",
                              labelStyle: TextStyle(fontSize: 20.0, color: Colors.amber),
                              hintStyle: TextStyle(fontSize: 18.0),
                              filled: true,
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            ),
                            validator: (value){
                              if (value == null || value.isEmpty) {
                                return "Please provide the name";
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          ElevatedButton(
                              onPressed: (){
                                final snackBar = SnackBar(
                                  content: Text("Data Added Successfully"),
                                  backgroundColor: (Colors.black),
                                  action: SnackBarAction(
                                    label: "dismiss",
                                    onPressed: (){
                                    },
                                  ),
                                );
                                if (_formKey.currentState!.validate()) {
                                  setState(() {
                                    databaseRef.child(DateTime.now().millisecondsSinceEpoch.toString()).set({
                                      "CustomerAddress" : addressController.text.toString(),
                                      "CustomerName" : cnameController.text.toString(),
                                      "FoodName" : fnameController.text.toString(),
                                      "FoodPrice" : priceController.text.toString(),

                                    });
                                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                    _showDialog();
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=> ScreenD()));
                                  });
                                }
                                addressController.text = "";
                                cnameController.text = "";
                                fnameController.text = "";
                                priceController.text = "";



                              }, child: Text("Proceed to Pay", style: TextStyle(fontSize: 20),),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.amber,

                            ),
                          )
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