import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:food_app/constants/lists.dart';
import 'package:food_app/constants/materials.dart';
import 'package:food_app/constants/widgets.dart';
import 'package:food_app/items.dart';
import 'package:food_app/modal.dart';

class DetailsScreen extends StatelessWidget {
  final ItemModel item;
  const DetailsScreen({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: MyColors.purpleA,
      body: ColorfulSafeArea(
        child: SizedBox(
            width: double.infinity,
            height: height,
            child: Stack(
                children: [
                  Hero(
                    tag: item.title,
                    child: SizedBox(
                      height: 300.0,
                      width: double.infinity,
                      child: Image.asset(
                          item.imageUrl,
                          fit: BoxFit.cover,
                        ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child:
                  SizedBox(
                    height: 500.0,
                    width: width,
                    child: DraggableScrollableSheet(
                      initialChildSize: 1,
                      minChildSize: 1,
                      maxChildSize: 1,
                      builder: (BuildContext context, ScrollController scrollController){
                        return Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: MyRadius.radiusA,
                              boxShadow: [
                                BoxShadow(
                                  color: MyColors.greyA,
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                ),
                              ]
                          ),
                          child: ListView(
                            controller: scrollController,
                            children: [
                              Padding(padding: MyPadding.mainPaddingB, child:
                              Column(
                                crossAxisAlignment: MyAlignment.crossAxisA,
                                children: [
                                  Row(
                                    mainAxisAlignment: MyAlignment.mainAxis,
                                    children: [
                                      Text(item.title, style: MyStyle.subElement),

                                      Text(item.price, style: MyStyle.buttonStyle),
                                    ],
                                  ),
                                  const CustomBox(height: 20.0, width:0.0),
                                  SizedBox(
                                    child: Row(
                                      children: const [
                                        Icon(Icons.star),
                                        Icon(Icons.star),
                                        Icon(Icons.star),
                                        Icon(Icons.star),
                                        Icon(Icons.star),
                                      ],
                                    ),
                                  ),
                                  const CustomBox(height: 20.0, width:0.0),
                                  Container(
                                    padding: MyPadding.paddingK,
                                    child: Text("Description : \n\n${item.description}", style: const TextStyle(fontSize: 16.0),),
                                  ),
                                  const CustomBox(height: 20.0, width:0.0),

                                  SizedBox(
                                    child: Row(
                                      mainAxisAlignment: MyAlignment.mainAxis,
                                      children: [
                                        Text(mainLabels.elementAt(3), style: MyStyle.foodPrice),
                                        GestureDetector(
                                          onTap: (){
                                            Navigator.push(context, MaterialPageRoute(builder: (context)=> const AllItems()));
                                          },
                                            child: Text(mainLabels.elementAt(4), style: MyStyle.foodPrice)),
                                      ],
                                    ),
                                  ),

                                  Padding(
                                    padding: MyPadding.paddingL,
                                  child: SizedBox(
                                    height: 230.0,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                        itemCount: 5,
                                        itemBuilder: (BuildContext context, int index){
                                          return Container(
                                            margin: MyPadding.paddingM,
                                            height: 200.0,
                                            width: 200.0,
                                            decoration: BoxDecoration(
                                              color: MyColors.white,
                                              borderRadius: MyRadius.mainRadius,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: MyColors.greyA,
                                                  spreadRadius: 5,
                                                  blurRadius: 3,
                                                ),
                                              ],
                                            ),
                                            child: Column(
                                              children: [
                                                Container(
                                                    width: double.infinity,
                                                    height: 140.0,
                                                    decoration: BoxDecoration(
                                                      color: MyColors.green,
                                                      borderRadius: MyRadius.mainRadius,
                                                    ),
                                                    child: ClipRRect(
                                                      borderRadius: MyRadius.radiusB,
                                                        child: Image.asset(foodImages[index], fit: BoxFit.cover,)),
                                                  ),
                                                SizedBox(
                                                  child: Column(
                                                    children: [
                                                      Text(foodNames[index], style: MyStyle.foodNames),
                                                      Text(foodPrice[index], style: MyStyle.foodPrice,),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        }),
                                  ),
                                  ),
                                ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  ),
                ],
              ),
          ),
        ),
    );
  }
}
