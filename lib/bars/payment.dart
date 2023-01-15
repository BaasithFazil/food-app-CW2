import 'package:flutter/material.dart';


class ScreenD extends StatelessWidget {
  const ScreenD({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              child: Text("Payment Details", style: TextStyle(fontSize: 22),),
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: "CardName",
                labelText: "Card Name",
                labelStyle: TextStyle(fontSize: 20.0, color: Colors.amber),
                hintStyle: TextStyle(fontSize: 18.0),
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: "CardName",
                labelText: "Card Name",
                labelStyle: TextStyle(fontSize: 20.0, color: Colors.amber),
                hintStyle: TextStyle(fontSize: 18.0),
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              children:[
                SizedBox(width: 10.0,),
                Container(
                  width: 100.0,
                 child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Month",
                  labelText: "Month",
                  labelStyle: TextStyle(fontSize: 16, color: Colors.amber),
                  hintStyle: TextStyle(fontSize: 14),
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
                ),
                SizedBox(width: 10.0,),
                Container(
                  width: 100.0,
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Year",
                      labelText: "Year",
                      labelStyle: TextStyle(fontSize: 16, color: Colors.amber),
                      hintStyle: TextStyle(fontSize: 14),
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10.0,),
                Container(
                  width: 100.0,
                  child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "CCV",
                      labelText: "CCV",
                      labelStyle: TextStyle(fontSize: 16, color: Colors.amber),
                      hintStyle: TextStyle(fontSize: 14),
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
              ]
            ),
          ],
        ),
      ),
    );
  }
}