import 'package:flutter/material.dart';

//colors
class MyColors {
  static const red = Colors.red;
  static const white = Colors.white;
  static const amber = Colors.amber;
  static const grey = Colors.grey;
  static const green = Colors.green;
  static const blue = Colors.blue;
  static final greyA = Colors.grey.withOpacity(0.7);
  static final purpleA  = Colors.deepPurple[100];

}

//paddings
class MyPadding {
  static const mainPadding = EdgeInsets.all(15.0);
  static const mainPaddingA = EdgeInsets.all(8.0);
  static const mainPaddingB = EdgeInsets.all(20.0);
   static const paddingA = EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0);
   static const paddingB = EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0);
   static const paddingC = EdgeInsets.only(right: 15.0);
   static const paddingD = EdgeInsets.only(left: 10.0, right: 10.0);
   static const paddingE = EdgeInsets.symmetric(horizontal: 15.0,vertical: 5.0);
   static const paddingF = EdgeInsets.only(left: 15.0, right: 15.0);
   static const paddingG = EdgeInsets.only(top: 20.0, left: 15.0);
   static const paddingI = EdgeInsets.only(top: 10.0, left: 15.0);
   static const paddingJ = EdgeInsets.symmetric(horizontal: 15.0);
   static const paddingK = EdgeInsets.symmetric(horizontal: 8.0);
   static const paddingL = EdgeInsets.symmetric(vertical: 10.0);
   static const paddingM = EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0);
}

//radius
class MyRadius {
  static final mainRadius = BorderRadius.circular(15.0);
  static final mainRadiusA = BorderRadius.circular(10.0);
  static const radiusA = BorderRadius.only(topLeft:  Radius.circular(25.0), topRight: Radius.circular(25.0));
  static const radiusB = BorderRadius.only(topLeft:  Radius.circular(15.0), topRight: Radius.circular(15.0));

}

//alignments
class MyAlignment {
  static const mainAxis = MainAxisAlignment.spaceBetween;
  static const mainAxisA  = MainAxisAlignment.start;
  static const crossAxis = CrossAxisAlignment.center;
  static const crossAxisA = CrossAxisAlignment.start;
  static const crossAxisB  = Axis.horizontal;
}

//icons
class MyIcons {
  static const exit = Icon(Icons.exit_to_app,);
  static const arrow = Icon(Icons.arrow_circle_right, size: 25,  color: Colors.yellow,);
}

//size (Height + Weight)
class Size {
  static const max = double.infinity;
}


//TextStyle
class MyStyle {
  static const subtitle = TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.bold,
    fontFamily: 'Roboto',
  );
  static const maintitle = TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.bold,
    fontFamily: 'Roboto',
    color: Colors.yellow
  );


  static const subElement = TextStyle(
    fontSize: 24,
  );
  static const imageName = TextStyle(
    fontSize: 18,
  );
  static const foodNames = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
  );
  static const foodDescription = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.normal,
  );
  static const foodPrice = TextStyle(
    fontSize: 16.0,
  );

  static const buttonStyle = TextStyle(
    fontSize: 20.0,
  );





  static const linkButton = TextStyle(
    fontSize: 18,
    color: Colors.blue,
    decoration: TextDecoration.underline,
  );
}