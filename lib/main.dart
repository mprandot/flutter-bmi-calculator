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

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  void resetFields () {
    weightController.text = "";
    heightController.text = "";
    setState(() {
      infoText = "Please, insert weight and height";
      formKey = GlobalKey<FormState>();
    });
  }

  void calculate() {
    setState(() {
      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text) / 100;
      double imc = weight / (height * height);

      if ( imc < 19.5 ){
        infoText = "You are underweight (${imc.toStringAsPrecision(3)})";
      }
      if (imc >= 19.5 && imc < 26.4){
        infoText = "You are at the ideal weight (${imc.toStringAsPrecision(3)})";
      }
      if (imc >= 26.4  && imc < 31) {
        infoText = "Are you overweight (${imc.toStringAsPrecision(3)})";
      }
      if (imc >= 31 ) {
        infoText = "You are obese (${imc.toStringAsPrecision(3)})";
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
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Icon(Icons.person_outline, size: 120.0, color: Colors.green),

                TextFormField(
                  controller: weightController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Weight (kg)",
                    labelStyle:  TextStyle(color: Colors.green)
                  ),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.green, fontSize: 25.0),
                  // ignore: missing_return
                  validator: (value) {
                    if (value.isEmpty){
                      return "Insert your weight";
                    }
                  },
                ),

                TextFormField(
                  controller: heightController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Height (cm)",
                    labelStyle:  TextStyle(color: Colors.green)
                  ),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.green, fontSize: 25.0),
                  // ignore: missing_return
                  validator: (value) {
                    if (value.isEmpty){
                      return "Insert your height";
                    }
                  }
                ),

                Padding(
                  padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child:
                  Container(
                    height: 50.0,
                    child: RaisedButton(
                      color: Colors.green,
                      onPressed: () {
                        if(formKey.currentState.validate()){
                          calculate();
                        }
                      },
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
          ),
        ) 
      ),
    );
  }
}