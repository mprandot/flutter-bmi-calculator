import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Home(),
    )
  );
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text("BMI calculator"),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: (){
                print("oi'");
              }
            )
          ],
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Icon(Icons.person_outline, size: 120.0, color: Colors.green),

              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Weight",
                  labelStyle:  TextStyle(color: Colors.green)
                ),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.green, fontSize: 25.0),
              ),

              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Height(cm)",
                  labelStyle:  TextStyle(color: Colors.green)
                ),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.green, fontSize: 25.0),
              ),

              Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: 
                Container(
                  height: 50.0,
                  child: RaisedButton(
                    color: Colors.green,
                    onPressed: () {},
                    child: Text("Calculate", style: TextStyle(color: Colors.white, fontSize: 25.0)),
                  ),
                ),
              ),

              Text(
                "Info", 
                textAlign: TextAlign.center, 
                style: TextStyle(color: Colors.green, fontSize: 25.0)
              )
            ],
          ),
        ) 
      ),
    );
  }
}