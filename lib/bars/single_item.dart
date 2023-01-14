import 'package:flutter/material.dart';


class SinglePage extends StatefulWidget {
  const SinglePage({Key? key}) : super(key: key);

  @override
  _SinglePageState createState() => _SinglePageState();
}

class _SinglePageState extends State<SinglePage> {
  List<String> animalNames = ['Elephant', 'Tiger', 'Kangaroo'];
  List<String> animalFamily = ['Elephantidae', 'Panthera', 'Macropodidae'];
  List<String> animalLifeSpan = ['60-70', '8-10', '15-20'];
  List<String> animalWeight = ['2700-6000', '90-310', '47-66'];
  int selectedTile = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Container(
              height: 400.0,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/food/food5.png"),
                ),
              ),
            ),
            bottomDetailsSheet(),
          ],
        ),
      ),
    );
  }

  Widget bottomDetailsSheet() {
    return DraggableScrollableSheet(
      initialChildSize: .6,
      minChildSize: .6,
      maxChildSize: .6,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.8),
                spreadRadius: 7,
                blurRadius: 5,
              ),
            ],
            borderRadius: BorderRadius.only(topRight: Radius.circular(15.0), topLeft: Radius.circular(15.0)),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Fried Rice with Chicken", style: TextStyle(fontSize: 30), textAlign: TextAlign.center,),
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Container(
                height: 100.0,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Fried rice with chicken 65. Available only at our store. We have added extra Curries to make much more delicious", style: TextStyle(fontSize: 20),),
                ),
              ),

              Container(
                height: 100.0,
                width: double.infinity,
                child: Center(child: Text("Rs: 1200/= Only", style: TextStyle(fontSize: 22),)),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Container(
                  height: 50.0,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: (){},
                    child: Text("Add to Order", style: TextStyle(fontSize: 20.0),),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                    ),
                  ),
                ),
              ),

            ],
          ),
        );
      },
    );
  }
}
