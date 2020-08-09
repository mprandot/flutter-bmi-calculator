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

  String infoText = "Please, insert your weight and height";

  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  void resetFields () {
    weightController.text = "";
    heightController.text = "";
    setState(() {
      infoText = "Please, insert weight and height";
    });
  }

  void calculate() {
    setState(() {
      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text) / 100;
      double imc = weight / (height * height);

      if ( imc < 19.5 ){
        infoText = "You are underweight";
      }
      if (imc >= 19.5 && imc < 26.4){
        infoText = "You are at the ideal weight";
      }
      if (imc >= 26.4  && imc < 31) {
        infoText = "Are you overweight";
      }
      if (imc >= 31 ) {
        infoText = "You are obese";
      }
    });

  }

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
              onPressed: resetFields
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
                controller: weightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Weight (kg)",
                  labelStyle:  TextStyle(color: Colors.green)
                ),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.green, fontSize: 25.0),
              ),

              TextField(
                controller: heightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Height (cm)",
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
                    onPressed: calculate,
                    child: Text("Calculate", style: TextStyle(color: Colors.white, fontSize: 25.0)),
                  ),
                ),
              ),

              Text(
                infoText, 
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