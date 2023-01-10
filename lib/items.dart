import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';



class AllItems extends StatefulWidget {
  const AllItems({Key? key}) : super(key: key);

  @override
  State<AllItems> createState() => _AllItemsState();
}

class _AllItemsState extends State<AllItems> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ColorfulSafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 200.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Wrap(
                    children: [Container(
                      height: 100.0,
                      width: 200.0,
                      color: Colors.red,
                    ),
                    ],
                  ),
                );
              }),
            ),

          ],
        ),
      ),
    );
  }
}


class CustomWidget extends StatelessWidget {
  const CustomWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
    );
  }
}


