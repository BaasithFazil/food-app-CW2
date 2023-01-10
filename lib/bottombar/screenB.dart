import 'package:flutter/material.dart';


class ScreenB extends StatelessWidget {
  const ScreenB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body:
          SizedBox(
          height: 300,
          width: width,
          child: ListView.builder(
            itemCount: 7,
              itemBuilder: (BuildContext context, int index) {
            return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                height: 100.0,
                width: 100.0,
                color: Colors.red,
                ),
            );
          }),
      ),
    );
  }
}

