



import 'package:flutter/material.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({ Key? key }) : super(key: key);

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> with TickerProviderStateMixin{

  @override
  Widget build(BuildContext context) {
    TabController tabController =
    TabController(length: 3, vsync: this);
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        SizedBox(
          width: width,
          child: Align(
            alignment: Alignment.bottomLeft,
            child: TabBar(
              isScrollable: true,
              controller: tabController,
              labelColor: Colors.blueAccent,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.brown,
              ),
              tabs: const [
                Tab(child: Text("home"),),
                Tab(child: Text("about"),),
                Tab(child: Text("contact"),),

              ],
            ),
          ),
        ),
        SizedBox(
          height: 350.0,
          child: TabBarView(
              controller: tabController,
              children: const [
                SizedBox(child: Text("Hello"),),
                SizedBox(child: Text("world"),),
                SizedBox(child: Text("Hello"),),
              ]),
        ),
      ],
    );
  }
}