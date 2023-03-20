// ignore_for_file: sort_child_properties_last, unnecessary_const

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
  final myController = TextEditingController();
  final myCon = TextEditingController();
  final control = TextEditingController();
  var result = "";
  Map<String, String> a = {
    'pregnancies': '0',
    'glucose': '',
    'bloodpressure': '80',
    'skinthickness': '22',
    'insulin': '',
    'bmi': '24',
    'dpf': '0.5',
    'age': ''
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Diabetes prediction App'),
          ),
          body: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    controller: myCon,
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
                    controller: control,
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
                      padding: const EdgeInsets.only(left: 150.0, top: 20.0),
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
        ));
  }

  predict() async {
    print(a);
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
