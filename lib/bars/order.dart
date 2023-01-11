import 'package:flutter/material.dart';
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


class ScreenC extends StatefulWidget {
  const ScreenC({super.key});

  @override
  State<ScreenC> createState() => _ScreenCState();
}

class _ScreenCState extends State<ScreenC> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hello"),
      ),
      body: Container()
//       body: FutureBuilder<List<Foods>> (
//         // future: fetchData(),
//         builder: (context, snapshot) {
//           if (snapshot.hasError) {
//             return const Center(
//               child: Text('An error has occurred!'),
//             );
//           } else if (snapshot.hasData) {
//             return PhotosList(photos: snapshot.data!);
//           } else {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//         },
//       ),
    );
  }
}