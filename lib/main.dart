// ignore_for_file: sort_child_properties_last

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _formKey = GlobalKey<FormState>();

  final myController = TextEditingController();
  var result = "";
  Map<String, String> a = {
    'pregnancies': '',
    'glucose': '',
    'bloodpressure': '',
    'skinthickness': '',
    'insulin': '',
    'bmi': '',
    'dpf': '',
    'age': ''
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Diabetes prediction App'),
            ),
            body: SingleChildScrollView(
              child: Form(
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
                        onFieldSubmitted: (value) {
                          setState(() {
                            a['pregnancies'] = value;
                          });
                          // a.add(value!);
                        },
                      ),
                      TextFormField(
                        controller: myController,
                        decoration: const InputDecoration(
                          icon: const Icon(Icons.scatter_plot),
                          hintText: 'glucose',
                          labelText: 'Glucose level',
                        ),
                        onFieldSubmitted: (value) {
                          setState(() {
                            a['glucose'] = value;
                          });
                        },
                      ),
                      TextFormField(
                        controller: myController,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.scatter_plot),
                          hintText: 'bloodpressure',
                          labelText: 'Blood Pressure (mmHg) eg. 80',
                        ),
                        onFieldSubmitted: (value) {
                          a['bloodpressure'] = value;
                        },
                      ),
                      TextFormField(
                        controller: myController,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.scatter_plot),
                          hintText: 'skinthickness',
                          labelText: 'Skin Thickness (mm) eg. 20',
                        ),
                        onFieldSubmitted: (value) {
                          setState(() {
                            a['skinthickness'] = value;
                          });
                        },
                      ),
                      TextFormField(
                        controller: myController,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.scatter_plot),
                          hintText: 'insulin',
                          labelText: 'Insulin Level (IU/mL) eg. 80',
                        ),
                        onFieldSubmitted: (value) {
                          setState(() {
                            a['insulin'] = value;
                          });
                          // a.add(value!);
                        },
                      ),
                      TextFormField(
                        controller: myController,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.scatter_plot),
                          hintText: 'bmi',
                          labelText: 'Body Mass Index (kg/m²) eg. 23.1',
                        ),
                        onFieldSubmitted: (value) {
                          setState(() {
                            a['bmi'] = value;
                          });
                        },
                      ),
                      TextFormField(
                        controller: myController,
                        decoration: const InputDecoration(
                          icon: const Icon(Icons.scatter_plot),
                          hintText: 'dpf',
                          labelText: 'Diabetes Pedigree Function eg. 0.52',
                        ),
                        onFieldSubmitted: (value) {
                          setState(() {
                            a['dpf'] = value;
                          });
                          //setState(() {});
                        },
                      ),
                      TextFormField(
                        controller: myController,
                        decoration: const InputDecoration(
                          icon: const Icon(Icons.scatter_plot),
                          hintText: 'age',
                          labelText: 'Age (years) eg. 34',
                        ),
                        onFieldSubmitted: (value) {
                          setState(() {
                            a['age'] = value;
                          });
                        },
                      ),
                      Container(
                          padding:
                              const EdgeInsets.only(left: 150.0, top: 20.0),
                          child: ElevatedButton(
                              // ignore: prefer_const_constructors
                              child: Text('Predict',
                                  style: const TextStyle(
                                      fontSize: 20, color: Colors.white)),
                              onPressed: predict)),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Center(
                            child: Text(
                          result,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        )),
                      )
                    ]),
              ),
            )));
  }

  predict() async {
    setState(() {
      this.result = 'Predicting...Please wait for the result';
    });
    String url =
        'https://diabetes-prediction-pmn1.onrender.com/predict?pregnancies=${a['pregnancies']}&glucose=${a['glucose']}&bloodpressure=${a['bloodpressure']}&skinthickness=${a['skinthickness']}&insulin=${a['insulin']}&bmi=${a['bmi']}&dpf=${a['dpf']}&age=${a['age']}';
    var j = await http.get(Uri.parse(url));
    var json = j.body;
    setState(() {
      result = json;
    });
  }
}
