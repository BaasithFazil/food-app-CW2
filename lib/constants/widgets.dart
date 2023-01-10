import 'package:flutter/material.dart';
//custom container creation
class CustomContainer extends StatelessWidget {
  final String title;
  final double height;
  final double width;
  final Color color;
  const CustomContainer({Key? key, required this.title, required this.height, required this.width, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: color,
      child: Text(title),
    );
  }
}

//custom sizedbox creation
class CustomBox extends StatelessWidget {
  final double height;
  final double width;
  const CustomBox({Key? key, required this.height, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
    );
  }
}
