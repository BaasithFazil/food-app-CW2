import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app/bars/screenB.dart';
import 'package:food_app/bars/screenC.dart';
import 'package:food_app/constants/lists.dart';
import 'package:food_app/constants/materials.dart';
import 'package:food_app/constants/widgets.dart';
import 'package:food_app/detail.dart';
import 'package:food_app/loginpages/userpage.dart';
import 'package:food_app/module.dart';



class ScreenA extends StatefulWidget {
  static const routeName = '/extractArguments';
  const ScreenA({super.key});

  @override
  State<ScreenA> createState() => _ScreenAState();
}

class _ScreenAState extends State<ScreenA> {
  final user = FirebaseAuth.instance.currentUser;


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding:
                  MyPadding.mainPadding,
              child: Row(
                mainAxisAlignment: MyAlignment.mainAxis,
                crossAxisAlignment: MyAlignment.crossAxis,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => UserPage()));
                    },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/avatar.png"),
                            fit:  BoxFit.cover,
                          ),
                          color: Colors.yellow,
                          shape: BoxShape.circle,
                        ),
                      ),
                  ),
                  Text.rich(
                    TextSpan(
                      text: titles.first,
                      style: MyStyle.subtitle,
                      children: [
                        TextSpan(
                          text: titles.elementAt(4),
                          style: MyStyle.maintitle,
                        )
                      ],
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/login');
                      },
                      icon: MyIcons.exit),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: SizedBox(
                width: Size.max,
                child: Column(
                  crossAxisAlignment: MyAlignment.crossAxisA,
                  mainAxisAlignment: MyAlignment.mainAxisA,
                  children: [
                    Text(
                      "Welcome ${user?.email!.replaceAll(RegExp('[^A-Za-z]'), '').replaceAll("com", "").replaceAll("gmail", "")}",
                      style: const TextStyle(fontSize: 22, color: Colors.grey),
                    ),
                    const CustomBox(height: 10.0, width: 0),
                    Text(titles.elementAt(1),
                      style: MyStyle.subtitle,
                    ),
                  ],
                ),
              ),
            ),
            const CustomBox(height: 15.0, width: 0.0),
            SizedBox(
              width: Size.max,
              child: Column(
                crossAxisAlignment: MyAlignment.crossAxisA,
                children: [
                  Text(
                    titles.elementAt(2),
                    style: MyStyle.subElement,
                  ),
                  SizedBox(
                    width: Size.max,
                    height: 150.0,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: MyPadding.mainPaddingA,
                            child: Container(
                              width: 90.0,
                              decoration: BoxDecoration(
                                  borderRadius: MyRadius.mainRadius,
                                  color: MyColors.amber.withOpacity(0.8)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                      height: 50.0,
                                      width: 50.0,
                                      child: Image.asset(smallImages[index])),
                                  Text(
                                    smallImagesNames[index],
                                    style: MyStyle.imageName,
                                  ),
                                  IconButton(
                                      onPressed: () {
                                      },
                                      icon: InkWell(
                                          onTap: () {
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => ScreenB()));
                                          },
                                          child: MyIcons.arrow)),
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                  Row(
                    mainAxisAlignment: MyAlignment.mainAxis,
                    children: [
                      Text(
                        titles.elementAt(3),
                        style: MyStyle.subtitle,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ScreenB()));
                        },
                        child: Padding(
                          padding: MyPadding.paddingC,
                          child: Text(
                            smallImagesNames.elementAt(4),
                            style: MyStyle.imageName,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: Size.max,
                    height: 270.0,
                    child: ListView.builder(
                      scrollDirection: MyAlignment.crossAxisB,
                      itemCount: items.length,
                      itemBuilder: (BuildContext context, int index) {
                        final item = items[index];
                        return Padding(
                          padding: MyPadding.mainPaddingA,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailsScreen(
                                            item: item,
                                          )));
                            },
                            child: Container(
                              width: 200,
                              height: 120.0,
                              decoration: BoxDecoration(
                                color: MyColors.white,
                                borderRadius: MyRadius.mainRadiusA,
                                boxShadow: [
                                  BoxShadow(
                                    color: MyColors.greyA,
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    height: 140.0,
                                    width: Size.max,
                                    decoration: BoxDecoration(
                                      borderRadius: MyRadius.mainRadiusA,
                                    ),
                                    child: Image.asset(
                                      foodImages[index],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(
                                    child: Text(
                                      foodNames[index],
                                      style: MyStyle.foodNames,
                                    ),
                                  ),
                                  const CustomBox(height: 5.0, width: 0.0),
                                  Padding(
                                    padding: MyPadding.paddingD,
                                    child: SizedBox(
                                      child: Text(
                                        foodDescription[index],
                                        style: MyStyle.foodDescription,
                                      ),
                                    ),
                                  ),
                                  const CustomBox(height: 5.0, width: 0.0),
                                  SizedBox(
                                    // ignore: prefer_interpolation_to_compose_strings
                                    child: Text(
                                      "Price " + foodPrice[index],
                                      style: MyStyle.foodPrice,
                                    ),
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
          ],
        ),
      ),
    );
  }
}
logOut() {
  FirebaseAuth.instance.signOut();
}


// 