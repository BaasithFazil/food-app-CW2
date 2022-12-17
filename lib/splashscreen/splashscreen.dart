import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        pages: [
          PageViewModel(
            title: "Less Talk : Eat More",
            body: "Where ever you are it's just a easy way to get your food with our app. We are well organized and quickly add categories of varieties to ensure customer services. We are adding veg and non-veg separately. You can find out more cliking the button.",
            image: buildImage("assets/images/image.jpg"),
            decoration: getPageDecoration(),
          ),
          PageViewModel(
            title: 'Your Choices',
            body: 'Can order any kind of varieties available in our app. Most usually we encourage our customers to make a perfect choices and fast methods. We are having Breakfast, Lunch and dinner here. Appetizer adding only for the lunch and dinner click arrow for more....',
            image: buildImage("assets/images/image3.jpg"),
            //getPageDecoration, a method to customise the page style
            decoration: getPageDecoration(),
          ),
          PageViewModel(
            title: 'Fast Delivery',
            body: 'Quick and decisive our workers and delivery teams. within the minimum of delivery time and quick delivers within the range of main city. Sometimes get late for the outside area but can ensure the delivery is on time ',
            image: buildImage("assets/images/image4.jpg"),
            //getPageDecoration, a method to customise the page style
            decoration: getPageDecoration(),
          ),
        ],
        onDone: () {
          if (kDebugMode) {
            print("Done Clicked");
          }
        },
        scrollPhysics: const ClampingScrollPhysics(),
        showDoneButton: true,
        showNextButton: true,
        showSkipButton: true,
        isBottomSafeArea: true,
        skip: const Text("Skip", style: TextStyle(fontWeight: FontWeight.w600, color: Colors.amber, fontSize: 20),),
        next: const Icon(Icons.forward, color: Colors.amber,),
        done: SizedBox(
          height: 30.0,
          width: 70.0,
          child: IconButton(onPressed: (){
            Navigator.pushNamed(context, '/major');
          }, icon: const Text("Done", style: TextStyle(fontSize: 16, color: Colors.amberAccent, fontWeight: FontWeight.bold),)),
        ),
        dotsDecorator: getDotsDecorator(),
      ),
  );
  }
}

Widget buildImage(String imagePath) {
  return Center(
      child: Image.asset(
        imagePath,
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.cover,
      ),
  );
}
PageDecoration getPageDecoration() {
  return const PageDecoration(
    pageColor: Colors.white,
    bodyPadding: EdgeInsets.only(top: 20, left: 20, right: 20),
    titlePadding: EdgeInsets.only(top: 10),
    bodyTextStyle: TextStyle(color: Colors.black54, fontSize: 15, fontFamily: 'Roboto'),
  );
}

DotsDecorator getDotsDecorator() {
  return const DotsDecorator(
    spacing: EdgeInsets.symmetric(horizontal: 2),
    activeColor: Colors.yellow,
    color: Colors.grey,
    activeSize: Size(12, 5),
    activeShape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(25.0)),
    ),
  );
}
