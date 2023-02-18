// ignore_for_file: sort_child_properties_last

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
//https://diabetes-prediction-pmn1.onrender.com/predict?pregnancies=2&glucose=150&bloodpressure=89&skinthickness=20&insulin=90&bmi=25&dpf=0.4&age=50
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _formKey = GlobalKey<FormState>();

  final myController = TextEditingController();
  var result = "";
  List<String> a = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Salary Prediction App'),
        ),
        //a.add(myController.value)
        body: Form(
          key: _formKey,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  controller: myController,
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.scatter_plot),
                    hintText: 'pregnancies',
                    labelText: 'Number of Pregnancies eg. 0',
                  ),
                  validator: (value) {
                    a.add(value!);
                  },
                ),
                TextFormField(
                  controller: myController,
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.scatter_plot),
                    hintText: 'glucose',
                    labelText: 'Number of Pregnancies eg. 0',
                  ),
                  validator: (value) {
                    a.add(value!);
                  },
                ),
                TextFormField(
                  controller: myController,
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.scatter_plot),
                    hintText: 'bloodpressure',
                    labelText: 'Blood Pressure (mmHg) eg. 80',
                  ),
                  validator: (value) {
                    a.add(value!);
                  },
                ),
                TextFormField(
                  controller: myController,
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.scatter_plot),
                    hintText: 'skinthickness',
                    labelText: 'Skin Thickness (mm) eg. 20',
                  ),
                  validator: (value) {
                    a.add(value!);
                  },
                ),
                TextFormField(
                  controller: myController,
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.scatter_plot),
                    hintText: 'insulin',
                    labelText: 'Insulin Level (IU/mL) eg. 80',
                  ),
                  validator: (value) {
                    a.add(value!);
                  },
                ),
                TextFormField(
                  controller: myController,
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.scatter_plot),
                    hintText: 'bmi',
                    labelText: 'Body Mass Index (kg/m²) eg. 23.1',
                  ),
                  validator: (value) {
                    a.add(value!);
                  },
                ),
                TextFormField(
                  controller: myController,
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.scatter_plot),
                    hintText: 'dpf',
                    labelText: 'Diabetes Pedigree Function eg. 0.52',
                  ),
                  validator: (value) {
                    a.add(value!);
                  },
                ),
                TextFormField(
                  controller: myController,
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.scatter_plot),
                    hintText: 'age',
                    labelText: 'Age (years) eg. 34',
                  ),
                  validator: (value) {
                    a.add(value!);
                  },
                ),
                Container(
                    padding: const EdgeInsets.only(left: 150.0, top: 20.0),
                    child: ElevatedButton(
                      // ignore: prefer_const_constructors
                      child: Text('Predict',
                          style: TextStyle(fontSize: 20, color: Colors.white)),
                      onPressed: predict,
                    )),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Center(
                      child: Text(
                    result,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
                )
              ]),
        ));
  }

  predict() async {
    setState(() {
      this.result = 'Predicting...Please wait for the result';
    });

    String url =
        'https://diabetes-prediction-pmn1.onrender.com/predict?pregnancies=${a[0]}&glucose=${a[1]}&bloodpressure=${a[2]}&skinthickness=${a[3]}&insulin=${a[4]}&bmi=${a[5]}&dpf=${a[6]}&age=${a[7]}';
    var j = await http.get(Uri.parse(url));
    var json = j.body;
    print(json);
    var data = jsonDecode(json);
    print(data);
    var result = data[0];
    print(result);
    var salary = result.toStringAsFixed(2);
    print(salary);
    setState(() {
      this.result =
          'Estimate Salary should be around - Rs.' + salary.toString();
    });
  }
}
